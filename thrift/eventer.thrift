namespace csharp Eventer
namespace rb Eventer

enum Associated {
  GROUP = 0,
  INDIVIDUAL = 1,
  STUDY_MODULE = 2
}

struct Client {
  1: string name,
  2: string client_key,
  3: bool active
}

struct Session {
  1: Client client,
  2: string reference,
  3: string friendly,
  4: date when,
  5: string information,
  6: i32 limit
}

struct Learner {
  1: string reference,
  2: string friendly
}

struct LearnerSession {
  1: i32 id,
  2: Learner learner,
  3: Session session,
  4: Associated associated,
  5: date invited,
  6: date confirmed,
  7: date attended,
  8: bool partial,
  9: bool satisified,
  10: string notes
}

exception InvalidOperation {
  1: i32 what,
  2: string why
}

service EventerApi {
  void ping(),

  list<Session> get_all_sessions_by_reference(1:string client_key, 2:string reference),
  list<LearnerSession> get_all_learners_for_session(1:Session session),

  oneway void mark_invited(1:LearnerSession learner_session) throws (1:InvalidOperation ouch),
  oneway void mark_confirmed(1:LearnerSession learner_session) throws (1:InvalidOperation ouch),
  oneway void mark_attended(1:LearnerSession learner_session) throws (1:InvalidOperation ouch),
  oneway void mark_partial(1:LearnerSession learner_session) throws (1:InvalidOperation ouch),
  oneway void mark_satisfied(1:LearnerSession learner_session) throws (1:InvalidOperation ouch),
  oneway void add_note(1:LearnerSession learner_session) throws (1:InvalidOperation ouch),
  
}