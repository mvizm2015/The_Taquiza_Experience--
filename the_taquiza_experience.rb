menu_items_list = []
menu = {
  sections: [{name: "Tacos",
             items: [
                        {name: "AL PASTOR",
                         description: "pork, achiote, pineapple",
                         price: 3.50},
                        {name: "CHORIZO",
                         description: "pork, paprika, cumin, garlic",
                         price: 3.50},
                        {name: "BARBACOA",
                         description: "beef, cumin, pasilla negra",
                         price: 3.50},
                        {name: "POLLO",
                         description: "chicken, scallion, cilantro",
                         price: 3.50},
                        {name: "HUITLACOCHE",
                         description: "corn ‘truffle’, corn, scallion",
                         price: 3.50},
                        {name: "CARNITAS",
                         description: "pork, orange, cinnamon",
                         price: 3.50},
                        {name: "ASADA",
                        description: "steak, citrus, chile de arbol",
                        price: 3.50},
                        {name: "LENGUA",
                         description: "beef tongue, cerveza victoria",
                         price: 3.50},
                        {name: "CAMARON",
                         description: "shrimp, red ‘mole’, slaw",
                         price: 5.00},
                        {name: "RAJAS",
                         description: "poblano, onion, crema, cotija",
                         price: 3.50},
                        {name: "CHAPULINES",
                         description: "grasshoppers, avocado, tajin",
                         price: 3.50},
                    ]
          }, {name: "Sides / Antojitos",
              items: [
                        {name: "TOTOPOS",
                         description: "hand torn blue masa chips",
                         price: 5.00},
                        {name: "ELOTE",
                         description: "charred corn, cilantrojalapeno crema, cotija",
                         price: 5.00},
                        {name: "QUINOA",
                         description: "jicama, corn, scallion, chile, nopal dressing",
                         price: 6.50},
                     ]
            }, {name: "BEER / CERVEZA",
               items: [
                        {name: "CORONA EXTRA",
                         price: 7.00},
                        {name: "CORONA LIGHT",
                         price: 6.00},
                        {name: "NEGRA MODELO",
                         price: 6.00},
                        {name: "PACIFICO",
                         price: 6.00},
                        {name: "TECATE",
                         price: 5.00},
                        {name: "VICTORIA",
                         price: 6.00},
                    ]
          }, {name: "BREAKFAST",
              items: [
                        {name: "HUEVOS A LA MEXICANA",
                         description: "scrambled eggs, pico, frijoles, crema, tortillas",
                         price: 5.00},
                        {name: "QUESADILLAS DE EPAZOTE",
                         description: "queso chihuahua, cotija, epazote, pico, frijoles",
                         price: 5.00},
                        {name: "TOSTADA DE AGUACATE",
                         description: "avocado, egg, frijoles, cabbage, cotija",
                         price: 6.00},
                        {name: "CHILAQUILES",
                         description: "crispy masa, pollo, salsa roja, eggs, crema",
                         price: 6.00},
                        {name: "TORTILLA DE AGUACATE",
                         description: "avocado, queso chihuahua, cotija, frijoles",
                         price: 6.00},
                     ]
          }, {name: "COFFEE & TEA",
              items: [
                        {name: "ESPRESSO SHOT",
                        price: 3.00},
                        {name: "ESPRESSO CORTADO",
                        price: 4.00},
                        {name: "ESPRESSO LATTE",
                        price: 5.00},
                        {name: "LA ENDULZADA",
                        description: "espresso, condensed milk, ice, shaken",
                        price: 5.00},
                        {name: "GREEN TEA",
                        description: "Jasmine Cloud by JoJo Tea",
                        price: 3.00},
                        {name: "ORANGE JUICE",
                        description: "Fresh Squeezed Florida OJ",
                        price: 6.00},
                      ],
           }]
  }
  def line
    puts "*" * 50
  end

  # method that outputs the menu by sections, when prompted. the argument is the hash menu.
  def show_menu(menu)
    menu[:sections].each do |show_menu_sections|
      puts show_menu_sections[:name]
      show_menu_sections[:items].each do |show_menu_items|
        puts show_menu_items[:name]
        puts show_menu_items[:description]
        puts show_menu_items[:price]
      end
      line
    end
  end

MENU = menu
final_order = []

require 'colorize'
puts 'WELCOME TO TAQUIZA!'.red

puts "🌮 " * 10

puts "Would you like to see the menu?"
puts "type: Show Menu"

input = gets.chomp.split.map(&:capitalize).join(' ')
puts "*" * 50

if input == "Show Menu"
  show_menu(MENU)
else input = false
end


def get_item_info(item_name)
  MENU[:sections].each do |section|
    section[:items].each do |item|
      if item[:name] == item_name
        return item
      end
    end
  end
end


def menu_items(menu_items_list)
  MENU[:sections].each do |show_menu_sections|
    show_menu_sections[:name]
    show_menu_sections[:items].each do |show_menu_items|
    menu_items_list << show_menu_items[:name].downcase
    end
  end
end


def place_order_menu(place_order, menu_items_list)
  if menu_items(menu_items_list).include? place_order
    final_order << get_item_info(place_order)
    "Will you like to order something else? or type done ordering to quit."
    sides_order = gets.chomp.downcase
  end
end

puts "What would you like to order?"
place_order = gets.chomp.upcase
final_order << get_item_info(place_order)

done_ordering = false
while !done_ordering do
  puts "Will you like to order something else? or type \"done ordering\" to quit."
  response = gets.chomp.upcase
  if response == "DONE ORDERING"
    done_ordering = true
  else
    final_order << get_item_info(response)
  end
end


def get_check(final_menu)
  final_menu.each do |price_item|
    puts price_item[:name]
    puts price_item[:price]
  end
end


get_check(final_order)
fine_price = 0

final_order.each do |item|
  fine_price += item[:price]
end

puts "Total Price is: $" + fine_price.to_s
puts "We have included 6% state tax to your total."
bill = fine_price
bill = bill.to_f
tip_percent = 0.06
tip = bill * tip_percent
total = tip + bill
puts "Your final total is $" '%.2f' % total
