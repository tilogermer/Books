class LoansController < ApplicationController

	def index
  	@loans = Loan.available.page(params[:page]).sorted
    @return_date_min = Loan.available.minimum(:date_end)
    @page_title = 'Loans'

  	if params[:library]
      @library_id = Library.find_by(name: params[:library]).id
      @loans = Loan.available.where(library_id: @library_id).page(params[:page]).sorted
      @return_date_min = Loan.available.where(library_id: @library_id).minimum(:date_end)

    elsif params[:reader]
      @reader_id = Reader.find_by(name: params[:reader]).id
      @loans = Loan.available.where(reader_id: @reader_id).page(params[:page])
      @return_date_min = Loan.available.where(reader_id: @reader_id).minimum(:date_end)
    end 
  	
 
  end
end
