require 'squib'

deck = Squib.csv(file: 'data/deck.csv')

Squib::Deck.new(cards: deck['Palo'].size, width: '62mm', height: '88mm', layout: 'layout.yml') do
  background color: '#fcfcfc'
  
  # PART 2: PIPS (Numbered cards)
  deck['Numero'].each_with_index do |num, i|
    n = num.to_i
    next if n >= 10 || n == 0
    
    n.times do |j|
      pip_layout_key = "pip_#{n}_#{(j + 65).chr}"
      
      # ADDED 'range: i' -> This ensures this PNG only goes on card i
      png file: "assets/#{deck['Icono'][i]}.png", 
          layout: pip_layout_key,
          range: i 
    end
  end

  # PART 3: FIGURES (10, 11, 12)
  deck['Numero'].each_with_index do |num, i|
    next if num.to_i < 10

    # ADDED 'range: i' to both commands below
    rect layout: :figure_art_box, 
         stroke_color: deck['ColorPrincipal'][i],
         stroke_width: '1mm',
         range: i
         
    # Load the artwork
    figname = "#{deck['Label'][i]}#{deck['PaloAbbr'][i]}"

    png file: "assets/#{figname}.png",
      layout: :figure_art_box, #Scale :)
      range: i,
      clip: :figure_art_box # Prevents overlapping`
  
  end
  
  # PART 1: Corner indices - why 1 ? Historical reasons
  rect x: '2.5mm', y: '2.5 mm', width: '12mm', height: '15mm',
    fill_color: '#fcfcfc', stroke_width: 0
  # Ese rectangulito sirve de fondo a nuestro numero
  text str: deck['Numero'], layout: :corner_suit, color: deck['ColorPrincipal']


  save_png prefix: 'card_'
end
