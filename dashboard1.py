import streamlit as st
import pandas as pd
from numerize.numerize import numerize
import plotly.express as px
import plotly.subplots as sp


#setting the page
st.set_page_config(page_title = 'Business Analytics Dashboard', page_icon = 'https://cdn.pixabay.com/photo/2012/04/01/17/14/earth-23593_1280.png', layout = 'wide')
st.subheader('Business Analytics Dashboard')

#load CSS Style
with open('style.css') as f:
    st.markdown(f'<style>{f.read()}</style>', unsafe_allow_html = True)

#loading data
    df = pd.read_csv('customers.csv')

#switcher(sidebar)
st.sidebar.header('Please filter')
department = st.sidebar.multiselect(
    'Filter Department',
    options = df['Department'].unique(),
    default = df['Department'].unique()
)

country = st.sidebar.multiselect(
    'Filter Country',
    options = df['Country'].unique(),
    default = df['Country'].unique()
)

business_unit = st.sidebar.multiselect(
    'Filter Business Unit',
    options = df['BusinessUnit'].unique(),
    default = df['BusinessUnit'].unique()
)
df_selection = df.query('Department==@department & Country ==@country & BusinessUnit==@business_unit')

#top Analytics
def metrics():
    from streamlit_extras.metric_cards import style_metric_cards
    col1,col2,col3 = st.columns(3)
    col1.metric(label = 'Total Customers', value = df_selection.Gender.count(),delta = 'ALL Customers')
    col2.metric(label = 'Total Annual Salary', value = f'{df_selection.AnnualSalary.sum():,.0f}', delta = df.AnnualSalary.median())
    col3.metric(label = 'Annual Salary', value=f'{df_selection.AnnualSalary.max() - df.AnnualSalary.min():,.0f}', delta = 'ANNUAL SALARY RANGE')
    style_metric_cards(background_color = '#121270', border_left_color = '#f20045', box_shadow = '3px')
def pie():
            div1 = st.empty()
            theme_plotly = None
            fig = px.pie(df_selection, values = 'AnnualSalary', names='Department', title='Customers by Country')
            fig.update_layout(legend_title = 'Country', legend_y=0.9)
            fig.update_traces(textinfo = 'percent+label', textposition = 'inside')
            div1.plotly_chart(fig, use_container_width =True, theme = theme_plotly)
def barchart():
            div2 = st.empty()
            theme_plotly = None
            fig = px.bar(df_selection, y= 'AnnualSalary', x='Department', title='Controlled test sizes, positions and angles', text_auto='.2s')
            fig.update_traces(textfont_size = 18, textangle=0 ,textposition = 'outside',cliponaxis =False)
            div2.plotly_chart(fig, use_container_width =True, theme = theme_plotly)
def table():
        with st.expander('Tabular'):
             shwdata = st.multiselect('Filter :', options=df.columns.tolist(), default=df.columns.tolist())
             st.dataframe(df_selection[shwdata],use_container_width =True)
from streamlit_option_menu import option_menu
with st.sidebar:
      selected = option_menu(
            menu_title = 'Main Menu',
            options = ['Home','Table'],
            icons = ['House','book'],
            menu_icon = 'cast',
            default_index = 0,
            orientation = 'vertical'
      )
if selected == 'Home':
      pie()
      barchart()
      metrics()
if selected == 'Table':
      metrics()
      table()
      st.dataframe(df_selection.describe().T,use_container_width=True)