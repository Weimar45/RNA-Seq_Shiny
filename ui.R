# Define la interfaz de usuario
ui <- dashboardPage(
  dashboardHeader(title = "Análisis de RNA-seq"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Carga de datos", tabName = "data", icon = icon("database")),
      menuItem("Análisis de expresión diferencial", tabName = "de", icon = icon("bar-chart")),
      menuItem("Visualización", tabName = "plot", icon = icon("area-chart")),
      menuItem("Análisis de enriquecimiento de genes", tabName = "enrich", icon = icon("sitemap"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "data",
              fileInput("file1", "Carga los datos de recuento de genes"),
              actionButton("submit", "Submit")),
      tabItem(tabName = "de",
              actionButton("run_de", "Ejecuta el análisis de expresión diferencial")),
      tabItem(tabName = "plot",
              plotOutput("de_plot")),
      tabItem(tabName = "enrich",
              actionButton("run_enrich", "Ejecuta el análisis de enriquecimiento de genes"))
    )
  )
)