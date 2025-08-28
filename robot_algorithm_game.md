## Maze admin klient ##
https://icy-coast-07e70d403.6.azurestaticapps.net?notifyPlayer=true

### Spillet foregår som følger ###
1. Åpne Admin klient for å oppretter nytt spill med gameId
2. Koble spiller til websocket med username og gameId
3. Spiller mottar ClientRegistered melding med ClientId som skal benyttes i kommunikasjon med server
4. Klikk "Start" i Admin klient
5. Spiller mottar NewGame melding
6. Spiller mottar NextMove melding med informasjon om det er vegg eller åpent i Nord, Sør, Øst, Vest
7. Spiller sender MovePlayer melding med GameId, ClientId og Direction
8. Repeter steg 6. og 7. inntil spiller er i mål
9. Når alle spillere er i mål, vil det komme ny NewGame melding, og nytt spill startes

### Koble spiller til server: ###
wss://mazeserverwebapp-apd7asc7aqcdasbv.norwayeast-01.azurewebsites.net/api/Maze/MazePlayer?username={username}&gameId={gameId}

**username:** Navn på spiller  
**gameId:** Id på spill man vil koble til (vises i Maze admin klient)  


## Websocket API ##
### Spillere kan motta følgende meldinger ###

#### Ved oppkobling til et spill:  ####

```
{  
    Action = "ClientRegistered",  
    ClientId = {clientId}  
}  
```
**clientId:** skal brukes i alle meldinger som sendes til server  


#### Ved start av nytt spill: ####

```
{  
   Action = "NewGame",  
}  
```


#### Ved melding om nytt flytt fra spiller: ####

```
{  
   Action = "NextMove",    
   North = "Wall" or "Open",
   West = "Wall" or "Open",
   East = "Wall" or "Open",
   South = "Wall" or "Open",
}
```
**North:** kan ha verdien "Wall" eller "Open"  
**West:** kan ha verdien "Wall" eller "Open"  
**East:** kan ha verdien "Wall" eller "Open"  
**South:** kan ha verdien "Wall" eller "Open"  

### Spillere kan sende følgende melding ###
Man svarer på en "NextMove" melding med en "MovePlayer" melding:  

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

### VIKTIG
Server aksepterer ikke meldinger raskere enn 40ms. Dersom man sender meldinger tettere enn 40ms, vil meldingen bli forkastet og man mottar ikke ny info om flytt.


