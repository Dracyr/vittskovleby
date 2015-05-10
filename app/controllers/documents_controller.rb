class DocumentsController < ApplicationController
  load_resource except: :create
  authorize_resource

  def index
    @documents = @documents.by_year
  end

  def show
    redirect_to @document.file.url
  end

  def new
  end

  def create
    @documents = Document.create_documents(document_params)
    respond_with @documents, location: documents_path
  end

  def destroy
    @document.destroy
    respond_with @document, location: documents_path
  end

  private

  def document_params
    params.require(:document).permit(:date, :file, file: [])
  end
end
