import pandas as pd

# Read the combined CSV file
plays_df = pd.read_csv('total_yards.csv')

# Save as JSON
plays_df.to_json('total_yards.json', orient='records', lines=True)

print('Converted plays.csv to plays.json')