class Document < ActiveRecord::Base
  scope :by_year, -> { order(date: :desc).group_by(&:year) }

  validates :file, presence: true
  validates :date, presence: true

  before_validation :set_date, on: :create

  dragonfly_accessor :file
  delegate :url, to: :file

  def self.create_documents(document_params)
    document_params[:file].map do |file|
      document = Document.create(file: file, date: document_params[:date])
    end
  end

  def title
    file_name.split('.').first.titlize
  end

  def year
    date.year
  end

  def to_s
    file_name
  end

  private

  def set_date
    return if date.present?
    match = /2\d{7}/.match(file_name)
    self.date = match ? Date.parse(match.to_s) : Date.today
  end
end
