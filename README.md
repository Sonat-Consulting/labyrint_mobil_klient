# Fagdag labyrint mobil klient

## start app i emulator

- (cmd+shift+p) => Flutter: Launch Emulator
- Flutter run

## build android

- flutter clean
- flutter build apk
- kopier fil til telefon / installer ved å klikke på apk filen

## Build ios

- flutter clean
- flutter build ios
- open ios/Runner.xcworkspace

## Oppgaver

1. Implementer mobilklient med knapper og evt. laser for å skyte andre
2. Implementer mobilklient med gyroskop og evt. laser for å skyte andre
3. Implementer mobilklient med kompass og evt. laser for å skyte andre

## Hvordan spille
1. Åpne Admin klient for å opprette nytt spill (https://icy-coast-07e70d403.6.azurestaticapps.net)
2. Se at header endrer til grønn farge og Game Id blir satt
3. Åpne mobilklient og angi Game Id og brukernavn
4. Klikk "Start" i Admin klient

## Meldinger som kan sendes fra mobilklient

### Bevege robot
```
{
  Action: "MovePlayer",
  GameId: {gameId},
  ClientId: {clientId},
  Direction: "North" or "South" or "West" or "East",
}                    
```
**Direction:** Skal ha verdien "North", "South", "West" eller "East"

### Skyte laser
```
{
  Action: "ShootLazer",
  GameId: {gameId},
  ClientId: {clientId},
  Direction: "North" or "South" or "West" or "East",
}                    
```
**Direction:** Skal ha verdien "North", "South", "West" eller "East"
