using { myCompany.hr.lms as st }  from '../db/Student';

service MyService {
    entity Students as projection on st.Students;
}