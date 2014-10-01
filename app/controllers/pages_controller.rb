
class PagesController < ApplicationController

	def admin
		@pages = Page.all
	end

	def create
		@page = Page.new( page_params )
		if @page.save
			set_flash 'Page Created'
		else	
			set_flash 'Page Could not be Saved', :error, @page
		end
		redirect_to edit_page_path( @page )
	end

	def destroy
		@page = Page.friendly.find( params[:id] )
	end

	def edit
		@page = Page.friendly.find( params[:id] )
	end

	def show
		@page = Page.friendly.find( params[:id] )
	end

	def update
		@page = Page.friendly.find( params[:id] )
		if @page.update( page_params )
			set_flash 'Page Saved'
		else
			set_flash "Page Couldn't be saved", :error, @page
		end
		redirect_to :back
	end

	private
		def page_params
			params.require( :page ).permit( :title, :content, :status )
		end

end