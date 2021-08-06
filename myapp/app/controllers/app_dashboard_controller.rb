class AppDashboardController < ApplicationController
  def index
  end

  def data
    products_db = Product.all
    CsvExportJob.perform_later(Product.all.to_a)
    render json: { message: products_db.length }, status: 200    
  end
end
