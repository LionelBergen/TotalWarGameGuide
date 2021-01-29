DROP DATABASE IF EXISTS total_war_info;

CREATE DATABASE total_war_info;
\c total_war_info;

CREATE TABLE public."PlayableHero" (
    "Name" text NOT NULL,
	"Damage" double NOT NULL,
    "SubredditMatch" text DEFAULT '.*'::text NOT NULL,
    "CommentMatch" text NOT NULL,
    "ReplyMessage" text NOT NULL,
    "IsReplyRegexp" boolean DEFAULT false,
    id integer NOT NULL,
    "Handle" text DEFAULT 'Agree-with-you'::text NOT NULL
);




