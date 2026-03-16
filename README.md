# Sakya Theme

Color theme inspired by [Sakya Monastery](https://en.wikipedia.org/wiki/Sakya_Monastery) thangka paintings and Tibetan Buddhist art.

Two variants named after the Bodhisattvas represented on Sakya Monastery's iconic tri-color walls:

- **Dorje** (dark) — Vajrapani's blue-black, power and protection
- **Karpo** (light) — Avalokiteshvara's white, compassion and purity

## Color System

### Five Dhyani Buddha Colors (semantic)

| Buddha | Color | Role |
|--------|-------|------|
| Ratnasambhava | warm ochre yellow | comments |
| Akshobhya | azurite blue | functions |
| Amoghasiddhi | malachite green | strings |
| Vairochana | chalk white | types |
| Amitabha | cinnabar red | errors |

### Mineral Pigment Colors (extended)

| Pigment | Color | Role |
|---------|-------|------|
| Gser (gold) | 24K gold | keywords |
| Mtshal (vermilion) | mercury sulfide red | error highlights |
| Mutsmen (lapis lazuli) | natural ultramarine | links, properties |
| Likhri (minium) | lead orange | numbers, constants |
| Spangma (malachite) | copper green | operators |
| Tsingkha (indigo) | plant indigo | tags |

## Ports

### VS Code

Copy or symlink the `vscode` folder to your VS Code extensions directory:

```sh
ln -s "$(pwd)/vscode" ~/.vscode/extensions/sakya-theme
```

Then select **Sakya Dorje** or **Sakya Karpo** from Preferences > Color Theme.

### iTerm2

1. Open iTerm2 > Preferences > Profiles > Colors
2. Click **Color Presets...** > **Import...**
3. Select `iterm2/sakya-dorje.itermcolors` or `iterm2/sakya-karpo.itermcolors`

### Starship

Copy or symlink the config:

```sh
cp starship/starship.toml ~/.config/starship.toml
# or
export STARSHIP_CONFIG="$(pwd)/starship/starship.toml"
```

## Cultural Background

The Sakya school of Tibetan Buddhism is known as the "Colorful School." Its monastery walls bear three sacred stripes — red (Manjushri/wisdom), white (Avalokiteshvara/compassion), and blue-black (Vajrapani/power).

The color values in this theme are calibrated against actual thangka mineral pigments: azurite, malachite, cinnabar, orpiment, lapis lazuli, and 24-karat gold powder, referencing art conservation studies and traditional painting manuals.

## License

MIT
