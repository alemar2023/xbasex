class PagesController < ApplicationController

  def home
  end

   # ---------------- user section --------------------------------------
  def user_orders
    render layout: 'dashboard'
  end

  def user_whishlist
  end


# ---------------- admin section --------------------------------------
  def admin

  end
  def admin_section


    @category = Category.all
    @brands = Brand.all

    @expansions = Expansion.all


    render layout: 'dashboard'


  end
# ---------------- SUPER ADMIN section --------------------------------------
  def super_section
    render layout: 'dashboard'
  end

# ---------------- VAR section --------------------------------------
  def brand

  end

end

