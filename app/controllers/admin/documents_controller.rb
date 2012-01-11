class Admin::DocumentsController < Admin::ApplicationController
  has_scope :page, :default => 1, :only => :index

  def index
    index! {
      @association = params[:association]
      @subject = Document.find(params[:subject_id]) if params[:subject_id]
    }
  end

  protected
    def collection
      if params[:utf8]
        searcher.pagination = paginate_options

        @results ||= searcher.results
        @results = @subject.nil? ? @results : @results - [@subject] - @subject.send(@association).map(&:objekt)
      else
        end_of_association_chain
      end
    end
end
