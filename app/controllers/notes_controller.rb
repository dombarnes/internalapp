class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy ]
  filter_resource_access

  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note, notice: 'Note was successfully created.'
    else
      render :new 
    end
  end

  def update
    if @note.update_attributes(note_params)
      redirect_to @note, notice: 'Note was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end
  
private
  def set_note
    @note = Note.find(params[:id])
  end
  
  def notes_params
    params.require(:notes).permit(:notes)
  end
end
