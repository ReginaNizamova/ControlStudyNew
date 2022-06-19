using System;
using System.Linq;

namespace ControlStudy
{
    class SessionTimer 
    {
        public DateTime startTime;
        public DateTime endTime;

        public SessionTimer()
        {
            startTime = DateTime.Now;
        }

        public void SaveTimeSession(string login) // Сохранение таймера
        {
            endTime = DateTime.Now;
            TimeSpan timeSpan = endTime - startTime;

            int idPerson = ControlStudyEntities.GetContext().People.Where(c => c.LoginUser == login).Select(c => c.IdPerson).FirstOrDefault();
            var findIdPerson = ControlStudyEntities.GetContext().Sessions.Where(c => c.IdPerson == idPerson).FirstOrDefault();


            if(findIdPerson == null)
            {
                Session sessionUser = new Session
                {
                    DateSession = startTime,
                    IdPerson = idPerson,
                    Time = Convert.ToString(timeSpan.Hours + ":" + timeSpan.Minutes + ":" + timeSpan.Seconds),
                    EndDateSession = endTime
                };

                ControlStudyEntities.GetContext().Sessions.Add(sessionUser);
            }
            else
            {
                findIdPerson.Time = Convert.ToString(timeSpan.Hours + ":" + timeSpan.Minutes + ":" + timeSpan.Seconds);
                findIdPerson.DateSession = startTime;
                findIdPerson.EndDateSession = endTime;
            }

            ControlStudyEntities.GetContext().SaveChanges();
        }
    }
}
