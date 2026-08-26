// Prova sintetica di collaudo: cita un esito EX-* che non compare nel registro. Deve far
// fallire il controllo - è precisamente il difetto segnalato: prima di questa correzione la
// famiglia EX-* non veniva riconosciuta affatto, e questa citazione sarebbe passata inosservata.
class EsitoAssenteTest {
  void esempio() {
    assert esito == "EX-COLLAUDO-INESISTENTE";
  }
}
