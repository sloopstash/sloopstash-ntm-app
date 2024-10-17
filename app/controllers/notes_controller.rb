  class NotesController < ApplicationController
    # before_action :set_note, only: [:edit, :update, :destroy]
    def index
      @notes = Note.all
    end

    def show
      @note = Note.find(params[:id])
    end

    def new
      @note = Note.new
    end

    def create
      # @note = Note.new(note_params)
      @note = current_user.notes.build(note_params)

      if @note.save
         redirect_to dashboard_path  # Redirect to home page after note creation
        # redirect_to @note
      else
        flash.now[:alert] = @note.errors.full_messages.join(', ')
        render :new, status: :unprocessable_entity
      end
    end

    def edit

      # @note = Note.find(params[:id])
    # render
  end

    def update
      @note = Note.find(params[:id])

      if @note.update(note_params)
        redirect_to dashboard_path, notice: 'Note was successfully updated.'
        # redirect_to @note
      else
        render :edit
      end
    end

    # def destroy
    #   @note = Note.find(params[:id])
    #   @note.destroy
    #   redirect_to root_path, status: :see_other
    # end

    def destroy
      @note = current_user.notes.find(params[:id])
      # @note = Note.find(params[:id])
      @note.destroy
      redirect_to dashboard_path
    end

    private

    def set_note
      @note = current_user.notes.find(params[:id])
    end

    # def current_user
    #   @current_user ||= User.find_by(user_id: session[:user_id])
    # end

    
      def note_params
        params.require(:note).permit(:title, :description)
      end
    end
  