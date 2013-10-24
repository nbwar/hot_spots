# This is the intial MVP ten bars:  Chosen because they were the most popular
# on 4square in 2012

ten_bars = [
  ['Bloodhound', '49c42f96f964a520a6561fe3'], ['Sycamore', '4c253819c11dc9b634d82624'],
  ['Lone Palm', '439c07e9f964a520ec2b1fe3'], ["Shotwell's", '49c83762f964a52003581fe3'],
  ["Bender's Bar and Grill", '40a2ba80f964a52006f31ee3'], ['Butter', '410c3280f964a520ba0b1fe3'],
  ['The Wreck Room', '4d361afdcea8b60cb1b715f8'], ['Broken Record', '47224f85f964a520cd4b1fe3'],
  ['The Page', '43eb859cf964a5203a2f1fe3'], ['Buena Vista Cafe', '45487bc1f964a520833c1fe3'],
  ['Southern Pacific Brewing', '4e8694e50aafe7a08166f7a3'], ['Andreesen Horowitz', '4a8db452f964a520901020e3'],
  ['Lambeau Field', '4b155083f964a520b7b023e3'], ['M&T Bank Stadium', '4b155061f964a52076b023e3'],
  ['Georgia Dome', '4a67b8b1f964a520f6c91fe3'], ['MetLife Stadium', '4bd44b84a8b3a5937e7f6b5f'],
  ['O.co Coliseum', '430e5b80f964a52043271fe3'], ['Dodger Stadium', '40db6b00f964a5207d011fe3']
]

ten_bars.each do |bar|
  Venue.create(name: bar[0], fsq_id: bar[1])
end