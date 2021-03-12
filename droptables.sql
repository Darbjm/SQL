Begin
  for c in (select table_name from user_tables) loop
    execute immediate ('drop table '||c.table_name||' cascade constraints');
  end loop;
  for s in (select sequence_name from user_sequences) loop
    execute immediate ('drop sequence '||s.sequence_name);
  end loop;
End;