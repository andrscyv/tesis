import sys
import csv

col_headers = [
    'user_turn_duration',
    'user_plays_per_minute',
    'user_requests_per_min',
    'simultaneous_user_capacity',
    'user_capacity_per_month_0.5',
    'user_capacity_per_month_1',
    'user_capacity_per_month_2',
    'user_capacity_per_month_5',
    ]

col_headers_spanish = [
    'Duración del turno del usuario (segundos)',
    'Tiros del usuario por minuto',
    'Peticiones generadas por usuario por minuto',
    'Capacidad de usuarios simultáneos por servidor',
    '0.5 hrs de uso al dia por usuario',
    '1 hr de uso al dia por usuario',
    '2 hrs de uso al dia por usuario',
    '5 hrs de uso al dia por usuario',
]
decimal_precision = 1
def capacity_metrics(
        user_turn_duration,
        bot_turn_duration,
    ):
    user_plays_per_minute = 60 / (user_turn_duration + 3*bot_turn_duration)

    # For a game with one human and 3 bots, every human play
    # would trigger 3 bot server requests
    user_requests_per_min = user_plays_per_minute * 3

    request_capacity_per_minute = 60 / bot_turn_duration

    simultaneous_user_capacity = request_capacity_per_minute / user_requests_per_min
    

    capacity_metrics = [
        round(user_turn_duration, decimal_precision),
        round(user_plays_per_minute, decimal_precision),
        round(user_requests_per_min, decimal_precision),
        round(simultaneous_user_capacity, decimal_precision),
    ]

    for user_hour_usage_per_day in [0.5, 1, 2, 5]:
        user_capacity_per_day = (24 / user_hour_usage_per_day) * simultaneous_user_capacity
        user_capacity_per_month = int(user_capacity_per_day * 28)
        capacity_metrics.append(user_capacity_per_month)

    for idx, metric in enumerate(capacity_metrics):
        print(f'{col_headers_spanish[idx]}: {metric}')

    print()
    return capacity_metrics

def write_to_csv(filename, col_names, rows):
        
    with open(filename, 'w') as csvfile: 
        csvwriter = csv.writer(csvfile) 
        csvwriter.writerow(col_names) 
        csvwriter.writerows(rows)


if __name__ == "__main__":

    if len(sys.argv) > 1 and sys.argv[1] == '-g':
        user_sups = [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1)]
        data = [ capacity_metrics(*sup) for sup in user_sups ]
        write_to_csv(sys.argv[2], col_headers_spanish, data)
        sys.exit(0)

    if len(sys.argv) < 2:
        print('Params: user_turn_duration, bot_turn_duration')
        sys.exit('Missing params')

    params = [float(p) for p in sys.argv[1:]]

    capacity_metrics(*params)

