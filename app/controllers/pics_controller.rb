class PicsController < ApplicationController
	before_action :find_pic, only: [:show, :edit, :update, :destroy, :upvote]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@pics = Pic.all.order("created_at DESC")
	end

	def show
	end

	def new
		@pic = current_user.pics.build
	end

	def create
		@pic = current_user.pics.build(pic_params)

		if @pic.save
			redirect_to @pic, notice: "Yesss! it was posted!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @pic.update(pic_params)
			redirect_to @pic, notice: "Congrates, Pic was updated"
		else
			render 'edit'
		end
	end

	def destroy
		@pic.destroy
		redirect_to root_path
	end

	def upvote
		@pic.upvote_by current_user
		redirect_to :back
	end

	private

	def find_pic
		@pic = Pic.find(params[:id])
	end

	def pic_params
		params.require(:pic).permit(:image, :title, :description)
	end
end
