# Fagdag labyrint mobil klient

## start app i emulator

- (cmd+shift+p) => Flutter: Launch Emulator
- Flutter run

## build android

- flutter clean
- flutter build apk
- kopier fil til telefon / installer ved å klikke på apk filen

## Kopier app til android telefon

- Aktivere utviklerinnstillinger:
  - Innstillinger → Om telefonen → Programvareinformasjon → Klikk 7-10 ganger på Build-nummer
- Koble telefonen til PC
- Godkjenn tilgang til telefondata (popup på telefon)
- Finn filen på android telefon → dobbeltklikk → gi tillatelse
- Takk nei til sikkerhetssjekk

## Build ios

- flutter clean
- flutter build ios
- open ios/Runner.xcworkspace

## Oppgaver

1. Implementer mobilklient med knapper og evt. laser for å skyte andre
2. Implementer mobilklient med gyroskop og evt. laser for å skyte andre
3. Implementer mobilklient med kompass og pedometer og evt. laser for å skyte andre
4. Implementer din egen kreative løsning for å styre roboten (stemmestyring, kamera, osv...)

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

## Spillregler
- 2 laser skudd per brett
- Blir man truffet, returnerer man til start
- Det blir gitt handicap ut fra løsning (voltestart)
  - Styre med knapper + x sekund
  - Styre med gyroskop + y sekund
  - Styre med kompass + z sekund
  - Alternative kreative løsninger (stemmestyring, kamera osv)
- Turnering der de 2 beste fra hver gruppe går til finale
