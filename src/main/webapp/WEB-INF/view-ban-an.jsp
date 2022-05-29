<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />

    <!-- Bootstrap datepicker JS-->
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        .title-box {
            padding: 3rem 0 2rem 0;
            text-align: center;
            display: flex;
        }

        .btn-nueva {
            margin: 2px 0 14px 0;
        }
    </style>

</head>

<body>
    <div class="container">

        <div class="title-box">
            <c:if test="${account != null}">
                <a href="/logout" type="button" class="btn btn-primary btn-nueva">
                    Đăng xuất
                </a>
            </c:if>
            <h1 class="flex-grow-1">Đặt bàn ăn</h1>

        </div>
        <div class="header-box mb-3">
            <div class="modal-body">
                <div class="container">
                    <form action="/table/search" method="post">
                        <div class="input-group col-12 justify-content-end mb-4">

                            <div class="form-outline " style="height: 38px;">
                                <input name="orderTime" class="h-100" type="datetime-local" id="datetime-local">
                            </div>
                            <button type="submit" class="btn btn-primary " style="height: 38px;">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </form>

                    <div class="render row g-4" id="render">
                        <div class="render row g-4" id="render">
                            <c:forEach var="table" items="${tables}">
                                <div class="col-3" style="height:110px; padding:0 15px">
                                    <button id="myBtn" type="button" data-bs-toggle="modal" data-bs-target="#modal-booking"
                                            class="content h-100 w-100 border-0 d-flex align-items-center justify-content-center"
                                            style=" background-color:rgb(235, 235, 73); font-weight:bold;color: rgb(129, 107, 66); pointer-events:all"
                                            onclick="onClick(${table.id - 1})">
                                        Bàn ${table.id} - ${table.deskAmount} ghế
                                    </button>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
        </div>




    </div>
    <div class="modal fade" id="modal-booking" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Đặt bàn</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/table/order" method="post">
                    <div class="modal-body">
                        <div class="row g-4">
                            <div class="col-12">
                                <h6>Id bàn</h6>
                                <input  name="tableId" type="text" id="id-ban" class="form-control" placeholder="1" aria-label="Id Bàn"
                                       >
                            </div>
                            <div class="col-12">
                                <h6>Tên bàn</h6>
                                <input type="text" id="ten-ban" class="form-control" placeholder="1"
                                    aria-label="Tên Bàn" disabled>
                            </div>

                            <div class="col-12">
                                <h6>Tên khách hàng</h6>
                                <input type="text" id="ten" class="form-control" placeholder="Tên khách hàng"
                                    aria-label="Tên" value="${account.customer.name}">
                            </div>
                            <div class="col-12">
                                <h6>Số điện thoại</h6>
                                <input type="text" id="sdt" class="form-control" placeholder="SĐT" aria-label="SĐT" value="${account.customer.phoneNumber}">
                            </div>
                            <div class="col-12" style="height:38px">
                                <input name="timeOrder" class="h-100" type="datetime-local" id="datetime-local">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Đặt bàn</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        const data = [
            {
                "idBan": 1,
                "tenBan": 'Bàn 1',
                "trangThai": 'Đã được đặt',
            },
            {
                "idBan": 2,
                "tenBan": 'Bàn 2',
                "trangThai": 'Trống',
            },
            {
                "idBan": 3,
                "tenBan": 'Bàn 3',
                "trangThai": 'Đã được đặt',
            },
            {
                "idBan": 4,
                "tenBan": 'Bàn 4',
                "trangThai": 'Đã được đặt',
            },
            {
                "idBan": 5,
                "tenBan": 'Bàn 5',
                "trangThai": 'Trống',
            },
            {
                "idBan": 6,
                "tenBan": 'Bàn 6',
                "trangThai": 'Trống',
            },
            {
                "idBan": 7,
                "tenBan": 'Bàn 7',
                "trangThai": 'Trống',
            },
            {
                "idBan": 8,
                "tenBan": 'Bàn 8',
                "trangThai": 'Trống',
            },


        ]
            ;
        function render() {
            let dataTable = ``;
            for (let i = 0; i < data.length; i++) {
                const check = data[i].trangThai == 'Trống' ? false : true;
                const color = check ? 'rgb(242, 186, 82)' : 'rgb(235, 235, 73)';
                const disabled = check ? 'none' : 'all';
                dataTable += `
            <div class="col-3" style="height:110px; padding:0 15px">
                            <button id="myBtn" type="button" data-bs-toggle="modal" data-bs-target="#modal-booking"
                                class="content h-100 w-100 border-0 d-flex align-items-center justify-content-center"
                                style=" background-color:${color}; font-weight:bold;color: rgb(129, 107, 66); pointer-events:${disabled}" 
                                onclick ="onClick(${i})" disabled:"true">
                                ${data[i].tenBan}
                            </button>
                        </div>
         `;


            }
            document.getElementById('render').innerHTML = dataTable;
        }
        function onClick(index) {
            document.getElementById('ten-ban').value = data[index].tenBan;
            document.getElementById('id-ban').value = data[index].idBan;
        }
        function notify(message) {
            alert(message);
        }
    // render()
    </script>
</body>

</html>