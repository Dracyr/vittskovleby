class Document < ActiveRecord::Base
  dragonfly_accessor  :file
  validates :file, presence: true
  delegate  :url, to: :file

  def self.create_documents(document_params)
    document_params[:file].each do |file|
      document = Document.create(file: file)
    end
  end

  def file_type
    file_name.split('.').last.upcase
  end
end
