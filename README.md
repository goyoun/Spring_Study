## 회원제게시판
### 회원가입과 게시판에 글을 쓰는 프로젝트

1. Project - MemberBoard

   A. Package 구성
   
   Package Name : com.icia.memberboard.controller
   Java : BoardController, CommentController, HomeController, MemberController
   
   Package Name : com.icia.memberboard.dto
   Java : BoardDTO, CommentDTO, PageDTO, MemberDTO
   
   Package Name : com.icia.memberboard.repository
   Java : BoardRepository, CommentRepository, MemberRepository
   
   Package Name : com.icia.memberboard.repository.mapper
   xml : board-mapper, comment-mapper, member-mapper
   
   Package Name : com.icia.memberboard.service
   Java : BoardService, BoardServiceInterface
   		  CommentService, CommentServiceInterface
   		  MemberService, MemberServiceInterface
   		  
   B. View 구성
   	board 폴더
   	detail.jsp : 게시판에 작성된 글에 대한 댓글과 파일을 볼 수 있는 jsp
   				 기능은 글쓴이는 삭제, 수정, 댓글을 달 수 있다.
   				 글쓴이를 제외한 회원은 댓글만 달 수 있고
   				 관리자 admin은 글을 삭제 할 수 있다.
   	
   	findAll.jsp: 로그인성공시 나오는 화면으로 작성된 모든 글을 확인 할 수 있다.
   				 마이페이지에서 본인이 회원가입 했을때 작성한 자료를 수정할 수 있다.
   				 Search를 통해서 작성자와 제목으로 나누어서 검색이 가능하며
   				 페이징 처리가 되어서 최신글 순서로 앞페이지에 배치가 되어있다.
   				 글쓰기 버튼을 누르면 글을 쓸 수 있고 파일을 추가 할 수 있다.
   				 읽을때마다 조회수가 올라간다.
   	
   	save.jsp  : findAll.jsp에서 글쓰기를 누르면 출력되는 화면 jsp
   				기본적으로 작성자를 입력안해도 sessionScope를 통해서 로그인한 사람이 작성자로
   				자동으로 등록되어있고 제목, 글내용, 파일선택을 통해 글을 작성할 수 있다.
   				글저장을 누를시 findAll 로 넘어오면서 작성한 글을 확인 할 수 있다.
   				
   	update.jsp : 본인의 글 또는 관리자가 글을 읽었을때 관리자는 삭제기능을 가능하게하고
   				 글쓴이는 수정과 삭제가 가능하다.
   				 사진도 수정이 가능하며 <c:> 태그를 사용하여서 각자 볼 수 있는 기능들을 정해놨다.
   				 
 	member 폴더
 	detail.jsp : 관리자만 볼 수 있는 공간으로써 그 회원의 모든 정보를 자세하게 볼 수 있다.
 				 관리자 전용 memberAll.jsp 에서 회원들의 정보를 보는 곳
 	
 	insert.jsp : 회원가입을 처리하는 곳이며 기본적으로 Id, Password, Name, E-mail, Phone, 대표사진을
 				 등록하면 회원가입이 가능하며 아이디 중복체크를 통해서 같은 아이디는 생성이 불가능하다.
 				 
 	login.jsp  : Id, Password 를 입력하면 게시판에 입장이 되는곳이며
 				 정보가 틀리게 입력이되면 login이 진행이 안되며 제대로 입력시 board폴더에있는 findAll로
 				 이동을 하여서 글을 쓰고 읽을수 있다.
 				 
 	memberAll.jsp : 관리자만 볼 수 있는 현재 회원가입이 된 회원들의 정보들이 나온다.
 				 관리자는 회원들을 삭제처리 할 수 있고 세부정보를 확인 할 수 있다.
 	
 	mypage.jsp : 로그인하면 모든 회원이 입장할 수 있고 입장 후에 본인의 정보를 수정 할 수 있다.
 				 이메일, 전화번호, 사진을 수정 할 수 있으며 수정완료시 변경된 정보를 확인할 수 있다.
 				 뒤로가기를 통해서 수정완료후 뒤로넘어가거나 그냥 넘어갈 수 있다. 
   
