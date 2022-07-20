IF NOT EXISTS (SELECT 1 FROM MessageTypes WHERE MessageType = 5)
	insert into MessageTypes (
	  MessageType
	, MessageCode
	, MessageDesc
	) values (
	  5
	, 'SPST1'
	, 'Standard Message Or Text'
	)
ELSE
	update MessageTypes 
	set MessageDesc ='Standard Message Or Text'
	where MessageType = 5