require_relative './part_1_solution.rb'

require 'pry'

# returns a new Array.
# Its members will be a mix of the item Hashes and, where applicable, the "ITEM W/COUPON" Hash.
def apply_coupons(cart, coupons)
  i = 0
  coupons.each do |coupon|
    item_with_coupon = find_item_by_name_in_collection(coupon[:item], cart)
    item_is_in_basket = !!item_with_coupon
    count_is_big_enough_to_apply = item_is_in_basket && item_with_coupon[:count] >= coupon[:num]
    if item_is_in_basket and count_is_big_enough_to_apply
      cart << { item: "#{item_with_coupon[:item]} W/COUPON",
                price: coupon[:cost] / coupon[:num],
                clearance: item_with_coupon[:clearance],
                count: coupon[:num]
              }
      item_with_coupon[:count] -= coupon[:num]
    end
    i += 1
  end
  cart
end

  # REMEMBER: This method **should** update cart

def apply_clearance(cart)
  cart.each do |hashes|
    if hashes.value?(true)
      hashes[:price] = (hashes[:price] * 0.8).round(2)
      end
    end
    cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
