# Projekt sieci firmowej z podziałem VLSM i routingiem (Cisco Packet Tracer)

Projekt i konfiguracja sieci komputerowej łączącej cztery podsieci działowe (`LAN1`–`LAN4`) oraz łącze punkt-punkt między routerami (`LANtech`), wydzielone z puli adresowej `10.10.89.0/24` za pomocą maski o zmiennej długości (**VLSM**)[cite: 12, 14].

![Schemat sieci](schemat-sieci.png)

## Podział na podsieci (VLSM)
Sieć bazowa `10.10.89.0/24` została podzielona optymalnie pod kątem zapotrzebowania na hosty[cite: 12, 14]:
* **`LAN1`** (`10.10.89.0/25`, maska `255.255.255.128`) – min. 100 hostów (do 126 użytecznych adresów)[cite: 12, 14].
* **`LAN3`** (`10.10.89.128/26`, maska `255.255.255.192`) – min. 50 hostów (do 62 użytecznych adresów)[cite: 12, 14].
* **`LAN2`** (`10.10.89.192/28`, maska `255.255.255.240`) – min. 10 hostów (do 14 użytecznych adresów)[cite: 12, 14].
* **`LAN4`** (`10.10.89.208/29`, maska `255.255.255.248`) – min. 5 hostów (do 6 użytecznych adresów)[cite: 12, 14].
* **`LANtech`** (`10.10.89.216/30`, maska `255.255.255.252`) – połączenie punkt-punkt między routerami (2 użyteczne adresy)[cite: 12, 14].

## Tabela adresacji urządzeń

| Urządzenie | Nazwa | Interfejs | Adres IP | Maska podsieci | Brama domyślna |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Router1 | `RNR1` | `g0/0/0` | `10.10.89.1` | `255.255.255.128` | —[cite: 14] |
| Router1 | `RNR1` | `g0/0/1` | `10.10.89.193` | `255.255.255.240` | —[cite: 14] |
| Router1 | `RNR1` | `s0/1/0` | `10.10.89.217` | `255.255.255.252` | —[cite: 14] |
| Router2 | `RNR2` | `g0/0/0` | `10.10.89.129` | `255.255.255.192` | —[cite: 14] |
| Router2 | `RNR2` | `g0/0/1` | `10.10.89.209` | `255.255.255.248` | —[cite: 14] |
| Router2 | `RNR2` | `s0/1/0` | `10.10.89.218` | `255.255.255.252` | —[cite: 14] |
| Switch1 | `SNR1` | `vlan1` | `10.10.89.126` | `255.255.255.128` | `10.10.89.1`[cite: 14] |
| Switch2 | `SNR2` | `vlan1` | `10.10.89.206` | `255.255.255.240` | `10.10.89.193`[cite: 14] |
| Switch3 | `SNR3` | `vlan1` | `10.10.89.190` | `255.255.255.192` | `10.10.89.129`[cite: 14] |
| Switch4 | `SNR4` | `vlan1` | `10.10.89.214` | `255.255.255.248` | `10.10.89.209`[cite: 14] |
| PC1 | `PC1` | `fe0` | `10.10.89.2` | `255.255.255.128` | `10.10.89.1`[cite: 14] |
| PC2 | `PC2` | `fe0` | `10.10.89.3` | `255.255.255.128` | `10.10.89.1`[cite: 14] |
| PC3 | `PC3` | `fe0` | `10.10.89.194` | `255.255.255.240` | `10.10.89.193`[cite: 14] |
| PC4 | `PC4` | `fe0` | `10.10.89.195` | `255.255.255.240` | `10.10.89.193`[cite: 14] |
| PC5 | `PC5` | `fe0` | `10.10.89.130` | `255.255.255.192` | `10.10.89.129`[cite: 14] |
| PC6 | `PC6` | `fe0` | `10.10.89.131` | `255.255.255.192` | `10.10.89.129`[cite: 14] |
| PC7 | `PC7` | `fe0` | `10.10.89.210` | `255.255.255.248` | `10.10.89.209`[cite: 14] |
| PC8 | `PC8` | `fe0` | `10.10.89.211` | `255.255.255.248` | `10.10.89.209`[cite: 14] |

## Zastosowane rozwiązania i konfiguracja (Cisco IOS)
* **Zabezpieczenia dostępu:** Hasła dla konsoli (`line con 0`), terminali wirtualnych VTY (`line vty 0 4`), szyfrowane hasło trybu uprzywilejowanego (`enable secret`) oraz komunikaty ostrzegawcze (`banner motd`)[cite: 12].
* **Routing:** Routing statyczny między `RNR1` i `RNR2` zapewniający pełną komunikację między wszystkimi czterema podsieciami.

## Zawartość katalogu
* `topologia-routing-4-lan.pkt` – plik projektu do uruchomienia w Cisco Packet Tracer.
* `schemat-sieci.png` – diagram logiczny sieci.
