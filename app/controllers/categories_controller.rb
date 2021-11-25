class CategoriesController < ApplicationController
            before_action :set_category, only: %i[ show edit update destroy ]
         
           # GET /libraries or /libraries.json
           def index
             @categories = Category.all
           end
         
           # GET /libraries/1 or /libraries/1.json
           def show
             @category = Category.find(params[:id])
           end
           
         
           # GET /libraries/new
           def new
             @category = Category.new
           end
         
           # GET /libraries/1/edit
           def edit
           end
         
           # POST /libraries or /libraries.json
           def create
             @category = Category.new(category_params)
         
               if @category.save
                 redirect_to categories_path, notice: "Library was successfully created." 
               else
                 render :new
               end
            end
           
         
           # PATCH/PUT /libraries/1 or /libraries/1.json
           def update
             respond_to do |format|
               if @category.update(category_params)
                 format.html { redirect_to @category, notice: "Library was successfully updated." }
                 format.json { render :show, status: :ok, location: @category }
               else
                 format.html { render :edit, status: :unprocessable_entity }
                 format.json { render json: @category.errors, status: :unprocessable_entity }
               end
             end
           end
         
           # DELETE /libraries/1 or /libraries/1.json
           def destroy
             @category.destroy
             respond_to do |format|
               format.html { redirect_to category_url, notice: "Library was successfully destroyed." }
               format.json { head :no_content }
             end
           end
         
           private
             # Use callbacks to share common setup or constraints between actions.
             def set_category
               @category = Category.find(params[:id])
             end
         
             # Only allow a list of trusted parameters through.
             def category_params
               params.require(:category).permit(:name)
             end
         end
      
   
   
   


