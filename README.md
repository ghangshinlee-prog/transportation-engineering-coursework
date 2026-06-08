# Transportation Engineering — Graduate Coursework

Selected graduate-course projects from my transportation-engineering studies at
**UC Irvine**, showing the technical toolkit behind my research: network
algorithms and optimization, travel-demand modeling, econometrics, and energy
data analysis.

Author: **Ghangshin Lee**. These are individually-authored course projects;
instructor-provided templates and group work are intentionally excluded.

---

## Contents

### 🕸️ [Network Algorithms & Optimization](network-algorithms-optimization/) — *CEE 228A*
Shortest-path and optimization fundamentals for transportation networks:
- **Dijkstra** and **Floyd–Warshall** shortest-path implementations from scratch
- **Linear-programming** formulations of the transportation and transshipment
  problems, solved with **Gurobi**

### 🚦 [Travel-Demand Modeling](travel-demand-modeling/) — *CEE 220A*
A four-step travel-demand workflow built on real **PeMS** detector data —
loading, cleaning, and structuring traffic-flow data for demand analysis.

### 📈 [Transportation Econometrics](transportation-econometrics/) — *CEE 224A*
Discrete and limited-dependent-variable modeling in **R**:
- **Tobit** model (censored regression)
- Linear-regression analysis of **MTA subway ridership vs. gasoline prices**

### ⚡ [Energy Data Analysis](energy-data-analysis/) — *CEE 298*
Analysis of the U.S. EIA **Residential Energy Consumption Survey (RECS 2020)**
in R — survey data wrangling, descriptive analysis, and visualization.

---

## Skills demonstrated

`Python` · `R` · graph algorithms · linear programming (`Gurobi`) ·
travel-demand modeling · censored/limited-dependent-variable regression ·
survey-data analysis · `pandas` · `tidyverse` · data visualization

## Notes on data

These are coursework artifacts. Most input datasets (PeMS, MTA, RECS, network
`.tntp` files) are public but not committed; file paths in the code have been
genericized to `./data`. Notebooks retain their executed outputs so the analysis
is readable directly on GitHub.

## License

[MIT License](LICENSE).
