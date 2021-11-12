class ApplicationState {
  final bool isInicializando;
  final bool isCarregando;
  final bool isAutenticado;
  final bool isDesautenticado;

  ApplicationState({
    required this.isInicializando,
    required this.isCarregando,
    required this.isAutenticado,
    required this.isDesautenticado,
  });

  factory ApplicationState.inicializando() {
    return ApplicationState(
        isInicializando: true,
        isCarregando: false,
        isAutenticado: false,
        isDesautenticado: false);
  }

  factory ApplicationState.carregando() {
    return ApplicationState(
        isInicializando: false,
        isCarregando: true,
        isAutenticado: false,
        isDesautenticado: false);
  }

  factory ApplicationState.autenticando() {
    return ApplicationState(
        isInicializando: false,
        isCarregando: false,
        isAutenticado: true,
        isDesautenticado: false);
  }

  factory ApplicationState.desautenticado() {
    return ApplicationState(
        isInicializando: false,
        isCarregando: false,
        isAutenticado: false,
        isDesautenticado: true);
  }
}
