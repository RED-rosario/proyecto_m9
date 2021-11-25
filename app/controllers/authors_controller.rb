class AuthorsController < ApplicationController
     before_action :set_author, only: %i[ show edit update destroy ]
      
        # GET /libraries or /libraries.json
        def index
          @authors = Author.all
        end
      
        # GET /libraries/1 or /libraries/1.json
        def show
          @author = Author.find(params[:id])
        end
  
      
        # GET /libraries/new
        def new
          @author = Author.new
        end
      
        # GET /libraries/1/edit
        def edit
        end
      
        # POST /libraries or /libraries.json
        def create
          @author = Author.new(author_params)
      
            if @author.save
               redirect_to authors_path, notice: "Library was successfully created." 
            else
              render :new
            end
            
        end
      
        # PATCH/PUT /libraries/1 or /libraries/1.json
        def update
          respond_to do |format|
            if @author.update(author_params)
              format.html { redirect_to @author, notice: "Library was successfully updated." }
              format.json { render :show, status: :ok, location: @author }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @author.errors, status: :unprocessable_entity }
            end
          end
        end
      
        # DELETE /libraries/1 or /libraries/1.json
        def destroy
          @author.destroy
          respond_to do |format|
            format.html { redirect_to authors_url, notice: "Library was successfully destroyed." }
            format.json { head :no_content }
          end
        end
      
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_author
            @author = Author.find(params[:id])
          end
      
          # Only allow a list of trusted parameters through.
          def author_params
            params.require(:author).permit(:name)
          end
        end
        
   


