class Admin::DocumentsController < Admin::ApplicationController
  has_scope :page, :default => 1, :only => :index

  def index
    @association = params[:association]
    @subject = Document.find(params[:subject_id]) if params[:subject_id]

    index!
  end

  protected
    def search_results
      @results = @subject.nil? ? super : super - [@subject] - @subject.send(@association).map(&:objekt)

      Kaminari.paginate_array(@results).page(params[:page]).per(per_page)
    end

    def searching_per_page_value
      10
    end

    def per_page
      @subject.nil? ? super : searching_per_page_value
    end
end
