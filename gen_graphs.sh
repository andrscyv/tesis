target_path=src/Imagenes/graficas_experimentos
source_path=experiment_results
rm ${target_path}/*

graph ${source_path}/mcts_saturation.csv \
--title 'Equipo MCTS vs Equipo Fuerte (MCTS con 1 segundo de presupuesto)' \
--xlabel 'Presupuesto de tiempo para MCTS (segundos)' \
--ylabel 'Porcentaje de victorias MCTS' \
--xcol 'mcts_time_budget' \
--ycol 'percent_wins_algo' \
--yscale 10 \
--yrange 0:70 \
--legend 'Porcentaje de victorias' \
--fontsize 9 \
--xtick-angle 90 \
-o ${target_path}/mcts_saturation.png

graph ${source_path}/mcts_is_correct.csv \
--title 'Equipo MCTS vs Equipo débil' \
--xlabel 'Presupuesto de tiempo para MCTS (segundos)' \
--ylabel 'Porcentaje de victorias MCTS' \
--xcol 'mcts_time_budget' \
--ycol 'percent_wins_algo' \
--yscale 10 \
--yrange 0:100 \
--bar \
--legend 'Porcentaje de victorias' \
--fontsize 9 \
--xtick-angle 90 \
-o ${target_path}/mcts_is_correct.png

graph ${source_path}/grid_search_vs_greedy.csv \
--title 'Búsqueda en cuadricula equipo PIMC vs equipo Jugadores Débil' \
--xlabel 'Número de escenarios (n)' \
--ylabel 'Porcentaje de victorias PIMC' \
--xcol 'pimc_num_simulations' \
--ycol 'percent_wins_algo' \
--yscale 10 \
--yrange 0:100 \
--bar \
--legend 'Porcentaje de victorias' \
--fontsize 9 \
--xtick-angle 90 \
-o ${target_path}/grid_search_vs_greedy.png

graph ${source_path}/grid_search_vs_greedy_25units.csv \
--title 'Búsqueda en cuadricula equipo PIMC vs equipo Jugadores Débil' \
--xlabel 'Número de escenarios (n)' \
--ylabel 'Porcentaje de victorias PIMC' \
--xcol 'pimc_num_simulations' \
--ycol 'percent_wins_algo' \
--yscale 10 \
--yrange 0:100 \
--bar \
--legend 'Porcentaje de victorias' \
--fontsize 9 \
--xtick-angle 90 \
-o ${target_path}/grid_search_vs_greedy_25units.png

graph ${source_path}/grid_search_vs_greedy_500units.csv \
--title 'Búsqueda en cuadricula equipo PIMC vs equipo Jugadores Débil' \
--xlabel 'Número de escenarios (n)' \
--ylabel 'Porcentaje de victorias PIMC' \
--xcol 'pimc_num_simulations' \
--ycol 'percent_wins_algo' \
--yscale 10 \
--yrange 0:100 \
--bar \
--legend 'Porcentaje de victorias' \
--fontsize 9 \
--xtick-angle 90 \
-o ${target_path}/grid_search_vs_greedy_500units.png

graph ${source_path}/grid_search_vs_strong.csv \
--title 'Búsqueda en cuadricula equipo PIMC vs equipo Jugadores Fuertes' \
--xlabel 'Número de escenarios (n)' \
--ylabel 'Porcentaje de victorias PIMC' \
--xcol 'pimc_num_simulations' \
--ycol 'percent_wins_algo' \
--yscale 1 \
--yrange 0:11 \
--bar \
--legend 'Porcentaje de victorias' \
--fontsize 9 \
--xtick-angle 90 \
-o ${target_path}/grid_search_vs_strong.png
