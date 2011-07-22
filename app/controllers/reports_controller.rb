class ReportsController < ApplicationController
  before_filter :login_required, :except => [:index, :login]
  before_filter :connect_to_tableau, :only => [:iframe,:javascript]

  def iframe
    @tabpath   = '/views/Finance/InvestinginDJIA'
    @tabparams = ':embed=yes&:comments=no&:toolbar=no'
    if @ticket > 0
      @tableau_url = "#{@tableau.server}/trusted/#{@ticket}/#{@tabpath}?#{@tabparams}"
    else
      flash[:error] = "#{current_user} does not have access to this page."
      redirect_to access_denied_reports_path
    end
  end

  def javascript
    @tabpath   = "trusted/#{@ticket}/views/Finance/InvestinginDJIA"
  end

  protected
  def login_required
    redirect_to reports_url unless current_user
  end
  def connect_to_tableau
    @tableau = TableauTrustedInterface.new
    @ticket    = @tableau.get_trusted_ticket(current_user, request.remote_ip)
  end
end
