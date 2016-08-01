require "date"

class CalendarController < ApplicationController
  def index
  	  @calendar = Hash.new
  	  @calendar[:info_man] = '男だけ予定がある場合は<font color="blue"><strong>青色</strong></font>'
      @calendar[:info_woman] = '女だけ予定がある場合は<font color="red"><strong>赤色</strong></font>'
      @calendar[:info_man_woman] = '両方とも予定がある場合は<font color="magenta"><strong>紫色</strong></font>'
      @calendar[:info_no_plan] = '両方とも予定がない場合は<font color="white"><strong>白色</strong></font>'

      @year
      @month
      @prevYear
      @nextYear
      @prevMonth
      @nextMonth

      today = Date.today
      if today.year == params[:year] && today.month == params[:month] || params[:year].blank?
        @year = today.year
        @month = today.month
        prevDate = Date.new(today.year, today.month-1, 1)
        nextDate = Date.new(today.year, today.month+1, 1)
        @prevYear = prevDate.year
        @nextYear = nextDate.year
        @prevMonth = prevDate.month
        @nextMonth = nextDate.month

        from_date = Date.new(today.year, today.month, 1).beginning_of_week(:sunday)
        to_date = Date.new(today.year, today.month, -1).end_of_week(:sunday)
        @calendar[:data] = from_date.upto(to_date)
      else
        @year = params[:year]
        @month = params[:month]
        selectDate = Date.new(@year.to_i, @month.to_i, 1)
        
        if selectDate.month == 1
          prevDate = Date.new(selectDate.year-1, 12, 1)
        else
          prevDate = Date.new(selectDate.year, selectDate.month-1, 1)
        end

        if selectDate.month == 12
          nextDate = Date.new(selectDate.year+1, 1, 1)  
        else
          nextDate = Date.new(selectDate.year, selectDate.month+1, 1)
        end
        @prevYear = prevDate.year
        @nextYear = nextDate.year
        @prevMonth = prevDate.month
        @nextMonth = nextDate.month

        from_date = Date.new(selectDate.year, selectDate.month, 1).beginning_of_week(:sunday)
        to_date = Date.new(selectDate.year, selectDate.month, -1).end_of_week(:sunday)
        @calendar[:data] = from_date.upto(to_date)
      end
  end

  def date

  end
end