class BooksController < ApplicationController
   before_action :set_book, only: %i[ show edit update destroy ]
         
           # GET /libraries or /libraries.json
           
           def index
             @books = Book.all
           end
         
           # GET /libraries/1 or /libraries/1.json
           def show
             @book = Book.find(params[:id])
             @categories = @book.categories
           end
                    
           # GET /libraries/new
           def new
             @book = Book.new
             @categories = Category.all
           end
         
           # GET /libraries/1/edit
           def edit
           end
         
           # POST /libraries or /libraries.json
           def create 
             
             @book = Book.new(book_params)
             @book.categories = params[:categories] if params[:categories]
             @author = Author.find(params[:book][:author_id])
         

               if @book.save
                redirect_to books_path, notice: "Library was successfully created." 
               else
                render :new
               end
            
           end
         
           # PATCH/PUT /libraries/1 or /libraries/1.json
           def update
             respond_to do |format|
               if @book.update(book_params)
                 format.html { redirect_to @book, notice: "Library was successfully updated." }
                 format.json { render :show, status: :ok, location: @book }
               else
                 format.html { render :edit, status: :unprocessable_entity }
                 format.json { render json: @book.errors, status: :unprocessable_entity }
               end
             end
           end
         
           # DELETE /libraries/1 or /libraries/1.json
           def destroy
             @book.destroy
             respond_to do |format|
               format.html { redirect_to books_url, notice: "Library was successfully destroyed." }
               format.json { head :no_content }
             end
           end
         
           private
             # Use callbacks to share common setup or constraints between actions.
             def set_book
               @book = Book.find(params[:id])
             end
         
             # Only allow a list of trusted parameters through.
             def book_params
               params.require(:book).permit(:title, :description, :author_id, :categories)
             end
         end
      
   
   
   


