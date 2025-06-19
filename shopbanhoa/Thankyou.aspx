<%@ Page Title="" Language="C#" MasterPageFile="~/HomeShop.Master" AutoEventWireup="true" CodeBehind="Thankyou.aspx.cs" Inherits="shopbanhoa.Thankyou" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">


     <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
     <link href="css/Animation1.css" rel="stylesheet" />
    <link href="css/Style.css" rel="stylesheet" />
    <script src="js/JavaScript1.js"></script>

        <meta charset="UTF-8" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg_hearts" style="margin-top:5rem;margin-bottom:10rem;">
         <div class="cssload-main">
	<div class="cssload-heart" style="margin-bottom:3rem;">
		<span class="cssload-heartL"></span>
		<span class="cssload-heartR"></span>
		<span class="cssload-square"></span>
	</div>
	<div class="cssload-shadow"></div>
              
</div>
       <p class="title_hearts"  data-aos="fade-right">Cảm ơn đã gửi đánh giá cho chúng tôi !</p>
         <a href="TatCaHoa.aspx" class="title_hearts-sm" data-aos="fade-left">Tiếp tục mua hoa quả <i class="fa-solid fa-arrow-right"></i></a>
    </div>
   



    <style>
        .bg_hearts {
            position:relative;
        }
        .title_hearts {
            position:absolute;
            top:10%;
         background-color:#FC0065;
         color:#fff;
         padding:1rem;
         border-radius:10px;
            left:7%;
            
        }
         .title_hearts-sm {
            position:absolute;
            top:10%;
         background-color:#FC0065;
         color:#fff;
         padding:1rem;
         border-radius:10px;
            right:15%;
            
        }
        .cssload-main {
  position: absolute;
  content: '';
  left: 50%;
  transform: translate(-100%, -240%);
  -o-transform: translate(-100%, -240%);
  -ms-transform: translate(-100%, -240%);
  -webkit-transform: translate(-100%, -240%);
  -moz-transform: translate(-100%, -240%);
}

.cssload-main * {
  font-size: 62px;
}

.cssload-heart {
  animation: cssload-heart 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -o-animation: cssload-heart 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -ms-animation: cssload-heart 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -webkit-animation: cssload-heart 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -moz-animation: cssload-heart 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  top: 50%;
  content: '';
  left: 50%;
  position: absolute;
}

.cssload-heartL {
  width: 1em;
  height: 1em;
  border: 1px solid rgb(252, 0, 101);
  background-color: rgb(252, 0, 101);
  content: '';
  position: absolute;
  display: block;
  border-radius: 100%;
  animation: cssload-heartL 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -o-animation: cssload-heartL 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -ms-animation: cssload-heartL 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -webkit-animation: cssload-heartL 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -moz-animation: cssload-heartL 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  transform: translate(-28px, -27px);
  -o-transform: translate(-28px, -27px);
  -ms-transform: translate(-28px, -27px);
  -webkit-transform: translate(-28px, -27px);
  -moz-transform: translate(-28px, -27px);
}

.cssload-heartR {
  width: 1em;
  height: 1em;
  border: 1px solid rgb(252, 0, 101);
  background-color: rgb(252, 0, 101);
  content: '';
  position: absolute;
  display: block;
  border-radius: 100%;
  transform: translate(28px, -27px);
  -o-transform: translate(28px, -27px);
  -ms-transform: translate(28px, -27px);
  -webkit-transform: translate(28px, -27px);
  -moz-transform: translate(28px, -27px);
  animation: cssload-heartR 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -o-animation: cssload-heartR 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -ms-animation: cssload-heartR 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -webkit-animation: cssload-heartR 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -moz-animation: cssload-heartR 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
}

.cssload-square {
  width: 1em;
  height: 1em;
  border: 1px solid rgb(252, 0, 101);
  background-color: rgb(252, 0, 101);
  position: relative;
  display: block;
  content: '';
  transform: scale(1) rotate(-45deg);
  -o-transform: scale(1) rotate(-45deg);
  -ms-transform: scale(1) rotate(-45deg);
  -webkit-transform: scale(1) rotate(-45deg);
  -moz-transform: scale(1) rotate(-45deg);
  animation: cssload-square 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -o-animation: cssload-square 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -ms-animation: cssload-square 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -webkit-animation: cssload-square 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -moz-animation: cssload-square 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
}

.cssload-shadow {
  top: 97px;
  left: 50%;
  content: '';
  position: relative;
  display: block;
  bottom: -.5em;
  width: 1em;
  height: .24em;
  background-color: rgb(215,215,215);
  border: 1px solid rgb(215,215,215);
  border-radius: 50%;
  animation: cssload-shadow 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -o-animation: cssload-shadow 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -ms-animation: cssload-shadow 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -webkit-animation: cssload-shadow 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
  -moz-animation: cssload-shadow 2.88s cubic-bezier(0.75, 0, 0.5, 1) infinite normal;
}

@keyframes cssload-square {
  50% {
    border-radius: 100%;
    transform: scale(0.5) rotate(-45deg);
  }

  100% {
    transform: scale(1) rotate(-45deg);
  }
}

@-o-keyframes cssload-square {
  50% {
    border-radius: 100%;
    -o-transform: scale(0.5) rotate(-45deg);
  }

  100% {
    -o-transform: scale(1) rotate(-45deg);
  }
}

@-ms-keyframes cssload-square {
  50% {
    border-radius: 100%;
    -ms-transform: scale(0.5) rotate(-45deg);
  }

  100% {
    -ms-transform: scale(1) rotate(-45deg);
  }
}

@-webkit-keyframes cssload-square {
  50% {
    border-radius: 100%;
    -webkit-transform: scale(0.5) rotate(-45deg);
  }

  100% {
    -webkit-transform: scale(1) rotate(-45deg);
  }
}

@-moz-keyframes cssload-square {
  50% {
    border-radius: 100%;
    -moz-transform: scale(0.5) rotate(-45deg);
  }

  100% {
    -moz-transform: scale(1) rotate(-45deg);
  }
}

@keyframes cssload-heart {
  50% {
    transform: rotate(360deg);
  }

  100% {
    transform: rotate(720deg);
  }
}

@-o-keyframes cssload-heart {
  50% {
    -o-transform: rotate(360deg);
  }

  100% {
    -o-transform: rotate(720deg);
  }
}

@-ms-keyframes cssload-heart {
  50% {
    -ms-transform: rotate(360deg);
  }

  100% {
    -ms-transform: rotate(720deg);
  }
}

@-webkit-keyframes cssload-heart {
  50% {
    -webkit-transform: rotate(360deg);
  }

  100% {
    -webkit-transform: rotate(720deg);
  }
}

@-moz-keyframes cssload-heart {
  50% {
    -moz-transform: rotate(360deg);
  }

  100% {
    -moz-transform: rotate(720deg);
  }
}

@keyframes cssload-heartL {
  60% {
    transform: scale(0.4);
  }
}

@-o-keyframes cssload-heartL {
  60% {
    -o-transform: scale(0.4);
  }
}

@-ms-keyframes cssload-heartL {
  60% {
    -ms-transform: scale(0.4);
  }
}

@-webkit-keyframes cssload-heartL {
  60% {
    -webkit-transform: scale(0.4);
  }
}

@-moz-keyframes cssload-heartL {
  60% {
    -moz-transform: scale(0.4);
  }
}

@keyframes cssload-heartR {
  40% {
    transform: scale(0.4);
  }
}

@-o-keyframes cssload-heartR {
  40% {
    -o-transform: scale(0.4);
  }
}

@-ms-keyframes cssload-heartR {
  40% {
    -ms-transform: scale(0.4);
  }
}

@-webkit-keyframes cssload-heartR {
  40% {
    -webkit-transform: scale(0.4);
  }
}

@-moz-keyframes cssload-heartR {
  40% {
    -moz-transform: scale(0.4);
  }
}

@keyframes cssload-shadow {
  50% {
    transform: scale(0.5);
    border-color: rgb(228,228,228);
  }
}

@-o-keyframes cssload-shadow {
  50% {
    -o-transform: scale(0.5);
    border-color: rgb(228,228,228);
  }
}

@-ms-keyframes cssload-shadow {
  50% {
    -ms-transform: scale(0.5);
    border-color: rgb(228,228,228);
  }
}

@-webkit-keyframes cssload-shadow {
  50% {
    -webkit-transform: scale(0.5);
    border-color: rgb(228,228,228);
  }
}

@-moz-keyframes cssload-shadow {
  50% {
    -moz-transform: scale(0.5);
    border-color: rgb(228,228,228);
  }
}
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            AOS.init();
        });

        // Cập nhật lại AOS khi có sự thay đổi trong nội dung của trang
        window.addEventListener('load', function () {
            AOS.refresh();
        });
    </script>
</asp:Content>
