// Prova sintetica di collaudo: cita EX-COLLAUDO-SCADUTO, il cui ultimo evento è "ritirato".
// Deve far fallire il controllo.
class EsitoRitiratoTest {
  void esempio() {
    assert esito == "EX-COLLAUDO-SCADUTO";
  }
}
