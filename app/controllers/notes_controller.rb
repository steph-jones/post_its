class NotesController < ApplicationController
  def index
    @notes = Note.order(title: :desc)
   end

   def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    # params = { id: "6" }
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to notes_path
    else
      render :edit
    end
  end


  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def destroy
    Note.find(params[:id]).destroy
    redirect_to notes_path
  end

  private
    def note_params
      params.require(:note).permit(:title, :author, :body)
    end
end
