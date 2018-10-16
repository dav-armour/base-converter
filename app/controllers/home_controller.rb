class HomeController < ApplicationController
  before_action :set_history, only: [:index, :calculate]
  CHARS = ('0'..'9').to_a + ('A'..'Z').to_a

  def index
  end

  def calculate
    @input = params[:input].upcase
    @from_base = params[:from_base].to_i
    @to_base = params[:to_base].to_i
    # Create regex for invalid input
    regex = Regexp.new("[^#{CHARS.first(@from_base).join}]")
    if @input =~ regex || @from_base < 2 || @from_base > 36 || @to_base < 2 || @to_base > 36
      @error = true
    else
      # Check if calculation already exists
      found = History.find_by(input: @input, from_base: @from_base, to_base: @to_base)
      if found.nil?
        # @output = convert(@input, @base)
        @output = dec_to_base(base_to_dec(@input, @from_base), @to_base)
        History.create(input: @input, from_base: @from_base, to_base: @to_base, output: @output)
      else
        @output = found.output # Get from database
        found.touch # Update timestamp
      end
    end
    # byebug
    render :index
  end

  private
  def set_history
    @history = History.all.order(updated_at: :desc).limit(20)
  end

  def dec_to_base(num, base)
    output = []
    num2 = num.dup
    while num2 > 0
      output << CHARS[num2 % base]
      num2 /= base
    end
    output.reverse.join
  end

  def base_to_dec(input, base)
    n = 0
    input.chars.each do |c|
      n = base * n + CHARS.index(c)
    end
    n
  end
end
