require_relative './part_1_solution.rb'

require 'pry'

# returns a new Array.
# Its members will be a mix of the item Hashes and, where applicable, the "ITEM W/COUPON" Hash.
def apply_coupons(cart, coupons)
  couponed_item = {}
  cart << couponed_item
  cart.each do |item_hash|
  counter = 0
  while counter < coupons.length
      item_lookup = find_item_by_name_in_collection(coupons[counter][:item],cart)
    if item_lookup && item_lookup[:count] >= coupons[counter][:num]
      couponed_item[:item] = coupons[counter][:item] + " W/COUPON"
      couponed_item[:price] = (coupons[counter][:cost] / coupons[counter][:num])
      couponed_item[:clearance] = item_hash[:clearance]
      couponed_item[:count] = item_hash[:count]
      item_hash[:count] -= coupons[counter][:num]
      # binding.pry
      counter += 1
      end
    end
  end
  cart
end


  # REMEMBER: This method **should** update cart


def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
