class Manage::ContextsController < ApplicationController
  def get_categories
    if %w(project document).include?(params[:paper_type])
      object = params[:paper_type].classify.constantize.new(:context_id => params[:id])
      render :template => 'application/new',
             :locals => {:resource => object, :collection_path => ''},
             :layout => false and return
    else
      render :nothing => true
    end
  end
end
