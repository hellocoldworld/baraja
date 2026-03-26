# Baraja Española con Squib

A procedurally generated Spanish Deck (Baraja Española) created using the [Squib](http://squib.rocks) Ruby DSL.

## Project Structure
* `deck.rb`: The main Ruby script that generates the cards.
* `layout.yml`: Defines the coordinates, fonts, and sizes for all card elements.
* `data/deck.csv`: The spreadsheet containing card values, suits, and color hex codes.
* `assets/`: Folder containing PNG/SVG icons for pips and figure artwork (Sota, Caballo, Rey).
* `_output/`: (Generated) The final high-quality PNG files for each card.

## Prerequisites
You need Ruby installed (tested on 3.0+).

```bash
gem install squib

```

## How to generate

To generate the deck, simply run:

```
ruby deck.rb
```

