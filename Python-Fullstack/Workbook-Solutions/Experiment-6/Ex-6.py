import pandas as pd

df = pd.read_csv("canteen.csv")

print("Original Data:")
print(df)

df['Sales'] = df['Sales'].fillna(0)
df['Date'] = pd.to_datetime(df['Date'])

total_sales = df['Sales'].sum()
average_sales = df['Sales'].mean()

print("\nTotal sales (Rs.):", total_sales)
print("\nAverage sales (Rs.):", round(average_sales, 2))

month = 1
filtered_data = df[df['Date'].dt.month == month]

print("\nJanuary month sales Data:")
print(filtered_data)

category_sales = df.groupby('Category')['Sales'].sum()

print("\nTotal Sales by category:")
print(category_sales)