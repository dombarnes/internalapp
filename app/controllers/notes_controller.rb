class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy ]
  filter_resource_access

  def index
    @notes = Note.all
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  def new
    @note = Note.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  def edit
  end

  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    
    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :ok }
    end
  end
  
private
  def set_note
    @note = Note.find(params[:id])
  end
  
  def notes_params
    params.require(:notes).permit(:notes)
  end
end
