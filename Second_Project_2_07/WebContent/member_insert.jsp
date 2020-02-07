<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
   <div class="container">
      <div class="page-header">
         <h1>ȸ�� ���</h1>
      </div>
      <form role="form" action="member_insert.do" method="post">
         <div class="row">
            <label class="col-xs-1" for="id">���̵�</label>
            <div class="col-xs-4">
               <input required type="text" class="form-control" id="id"
                  name="c_member_id" placeholder="���̵� �Է��ϼ���"><span
                  id="idmsg"></span>
            </div>
            <div class="col-xs-1">
               <button id="idcheck" class="btn btn-danger">�ߺ�Ȯ��</button>
            </div>
         </div>
         <br>
         <div class="row">
            <label class="col-xs-1" for="pw">��й�ȣ</label>
            <div class="col-xs-5">
               <input required type="password" class="form-control" id="pw"
                  name="c_member_password" placeholder="��й�ȣ�� �Է��ϼ���"> <span
                  id="pwmsg"></span>
            </div>
         </div>
         <br>
         <div class="row">
            <label class="col-xs-1" for="pwck">��й�ȣȮ��</label>
            <div class="col-xs-5">
               <input required type="password" class="form-control" id="pwck"
                  name="pwcheck" placeholder="��й�ȣ Ȯ��"> <span
                  id="pwcheckmsg"></span>
            </div>
         </div>
         <br>
         <div class="row">
            <label class="col-xs-1" for="name">�̸�</label>
            <div class="col-xs-5">
               <input required type="text" class="form-control" id="name"
                  name="c_member_name" placeholder="�̸��� �Է��ϼ���">
            </div>
         </div>
         <br>
         <div class="row">
            <label class="col-xs-1" for="gender">����</label>
            <div class="col-xs-5">
               <input type="radio" id="gender" name="c_member_gender" value="m"
                  checked>���� <input type="radio" id="gender"
                  name="c_member_gender" value="f">����
            </div>
         </div>
         <br>
         <div class="row">
            <label class="col-xs-1" for="birth">�������</label>
            <div class="col-xs-5">
               <input required type="date" class="form-control" id="birth"
                  name="c_member_birth">

            </div>
         </div>
         <hr>
         <div class="row">
            <div class="col-xs-12">
               <button id="submit" type="submit" class="btn btn-danger" onclick="button_event();">ȸ�����</button>
            </div>
         </div>

      </form>
   </div>

   <script type="text/javascript">
      $(document).ready(function() {
         var ckid = '0';
         var ckpw = '0';
         var ckpwck = '0';

         $("#idcheck").click(function() {
            var ida = $("input[name='c_member_id']").val();
            var limit = /^[a-zA-Z0-9]{1,6}$/;

            if (!limit.test(ida)) {
               $("#idmsg").text("6�� ���� ���� , ���ڸ� ����Ͻÿ�.");
               $("#idmsg").css("color", "red");
               ckpw = '0';
            } else {
               $.ajax({
                  type : 'get',
                  url : 'checkid.do',
                  data : {
                     id : ida
                  },
                  dataType : 'text',
                  success : function(result) {
                     if (result == "1") {
                        $("#idmsg").text("��� ������ ���̵� �Դϴ�.");
                        $("#idmsg").css("color", "blue");
                        ckid = '1';
                     } else if (result == "0") {
                        $("#idmsg").text("����� �� ���� ���̵� �Դϴ�.");
                        $("#idmsg").css("color", "red");
                        ckid = '0';
                     }
                  }
               });
            }
            return false;
         });

         $("#idcheck").keydown(function() {
            ckid = '0';
            $("#idmsg").text("");
         });

         $("input[name='c_member_password']").change(function() {
            var pw = $("input[name='c_member_password']").val();
            var limit = /^[a-zA-Z0-9]{1,12}$/;

            if (!limit.test(pw)) {
               $("#pwmsg").text("12�� ���� �� �ҹ���, ���ڸ� ����Ͻÿ�.");
               $("#pwmsg").css("color", "red");
               ckpw = '0';
            } else {
               $("#pwmsg").text("");
               ckpw = '1';
            }
         });

         $("input[name='pwcheck']").change(function() {
            var pw = $("input[name='c_member_password']").val();
            var pwcheck = $("input[name='pwcheck']").val();

            if (pw != pwcheck) {
               $("#pwcheckmsg").text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
               $("#pwcheckmsg").css("color", "red");
               ckpwck = '0';
            } else {
               $("#pwcheckmsg").text("��й�ȣ�� ��ġ�մϴ�.");
               $("#pwcheckmsg").css("color", "blue");
               ckpwck = '1';
            }
         });
         $("#submit").click(function() {
            if (ckid != '1') {
               alert("���̵� �ߺ� Ȯ���� ���ּ���.");
               return false;
            } else if (ckpw != '1') {
               alert("��� ������ ��й�ȣ�� �Է��Ͻÿ�.");
            } else if (ckpwck != '1') {
               alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
            }

         });
      });

   
      function button_event() {

         if (confirm("ȸ������Ͻðڽ��ϱ�?") == true) { //Ȯ��

            document.form.submit();

         } else { //���

            return;

         }

      }
      
      
   </script>



</body>
</html>