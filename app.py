import pstats
import streamlit as st
import pickle
import numpy as np
import warnings
warnings.simplefilter(action='ignore', category=FutureWarning)


def load_model():
    with open('reg002.pkl', 'rb') as file:
        data = pickle.load(file)
    return data

data = load_model()
regressor = data["model"]
sex_r = data["sex"]
address_r = data["address"]
famsize_r = data["famsize"]
Pstatus_r = data["pstatus"]
schoolsup_r = data["schoolsup"]
famsup_r = data["famsup"]
paid_r = data["paid"]
activities_r = data["activities"]
nursery_r = data["nursey"]
higher_r = data["higher"]
internet_r = data["internet"]
def show_predict_page():
    st.title("Student Academic Performance Prediction")

    st.write("""### We need some information to predict the Student Academic Performance""")
    Name  = st.text_input('Enter Student Name')
    sex = ['F','M']
    age = [13, 12, 10, 11, 14, 17, 15, 16]
    address	= ['U','R']
    famsize	 = ['GT3', 'LE3']
    Pstatus	 = ['A','T']
    Medu = [4,1, 3, 2, 0]
    Fedu = [4, 1, 3, 2, 0]		
    traveltime =[2, 1, 3, 4]
    studytime =[2 ,1 ,3 ,4]
    failures = [0, 3, 1, 2]	
    schoolsup	=['yes', 'no']
    famsup	 =['yes', 'no']
    paid	=['yes', 'no']
    activities	=['yes' ,'no']
    nursery	=['yes', 'no']
    higher	= ['yes', 'no']
    internet  = ['yes', 'no']	
    famrel	=[4, 5, 3, 1, 2]
    freetime=[4 ,5 ,3 ,1, 2]	
    health	=[4 ,5, 3, 1, 2]
    absences =[ 4 , 2,  6,  0, 10,  8, 16, 14,  1, 12, 24, 22, 32, 30, 21, 15,  9, 18, 26,  7, 11,  5, 13,  3]	
    
    SEX = st.selectbox('Gender',sex)
    AGE = st.selectbox('Age',age)
    ADDRESS = st.selectbox('Location',address)
    FAMSIZE = st.selectbox('Family Size',famsize)
    PSTATUS = st.selectbox('Parental Status',Pstatus)
    MEDU = st.selectbox('Mother Education Level',Medu)
    FEDU = st.selectbox('Father Education Level',Fedu)
    TRAVELTIME = st.selectbox('Travel Time',traveltime)
    STUDYTIME = st.selectbox('Study Time',studytime)
    FAILURES = st.selectbox('Past Failures',failures)
    SCHOOLSUP = st.selectbox('School Support',schoolsup)
    FAMSUP = st.selectbox('Family Support',famsup)
    PAID = st.selectbox('Extra Paid for Course',paid)
    ACTIVITIES = st.selectbox('Extra Activities',activities)
    NURSERY = st.selectbox('Attended Nursery School',nursery)
    HIGHER = st.selectbox('PLan on Attending Higher School',higher)
    INTERNET = st.selectbox('Internet Access',internet)
    FAMREL = st.selectbox('Level of Family Relationship',famrel)
    FREETIME = st.selectbox('Level of Free Time',freetime)
    HEALTH = st.selectbox('Health Status',health)
    ABSENCES = st.selectbox('Numbers of time Absence',absences)
    
    ok = st.button("Calculate Student Score")
    if ok:
        X = np.array([[SEX, AGE, ADDRESS,FAMSIZE,PSTATUS,MEDU,FEDU,TRAVELTIME,STUDYTIME,FAILURES,SCHOOLSUP,FAMSUP,PAID,ACTIVITIES,NURSERY,HIGHER,INTERNET,FAMREL,FREETIME,HEALTH,ABSENCES ]])
        X[:, 0] = sex_r.transform(X[:,0])
        X[:, 2] = address_r.transform(X[:,2])
        X[:, 3] = famsize_r.transform(X[:,3])
        X[:, 4] = Pstatus_r.transform(X[:,4])
        X[:, 10] = schoolsup_r.transform(X[:,10])
        X[:, 11] = famsup_r.transform(X[:,11])
        X[:, 12] = paid_r.transform(X[:,12])
        X[:, 13] = activities_r.transform(X[:,13])
        X[:, 14] = nursery_r.transform(X[:,14])
        X[:, 15] = higher_r.transform(X[:,15])
        X[:, 16] = internet_r.transform(X[:,16])
        X = X.astype(float)
        score = regressor.predict(X)
        st.subheader(f"The estimated score is {score[0]:.2f}")
show_predict_page()