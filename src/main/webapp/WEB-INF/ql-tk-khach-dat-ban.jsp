<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            <a href="/admin" type="button" class="btn btn-primary btn-nueva">
                Home
            </a>
            <h1 class="flex-grow-1">Quản Lý Tài khoản khách hàng</h1>
        </div>


        <table class="table table-bordered grocery-crud-table table-hover">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${customers}">
                    <tr>
                        <td>
                            ${customer.id}
                        </td>
                        <td>
                                ${customer.name}
                        </td>
                        <td>
                                ${customer.address} </td>
                        <td>
                                ${customer.phoneNumber} </td>
                        <td>
                                ${customer.account.email} </td>
                        <td>
                            <button type="button" class="btn btn-default btn-outline-dark" data-bs-toggle="modal"
                                    data-bs-target="#modal-edit">
                                Edit
                            </button>
                            <form action="/admin/customer/delete/${customer.id}" method="post">
                                <button type="submit" class="btn btn-default btn-outline-dark">
                                    Delete
                                </button>
                            </form>


                        </td>
                    </tr>
                </c:forEach>



            </tbody>
        </table>

    </div>
    <!-- Modal Edit -->
    <div class="modal fade" id="modal-edit" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Edit form</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/admin/customer/update" method="post">
                    <div class="modal-body">
                        <div class="row g-4">
                            <div class="col-12">
                                <input type="number" name="id" class="form-control" placeholder="Id" aria-label="Id">
                            </div>
                            <div class="col-12">
                                <input type="text" name="name" class="form-control" placeholder="Name" aria-label="First name">
                            </div>
                            <div class="col-12">
                                <input type="text" name="address" class="form-control" placeholder="Address" aria-label="Address">
                            </div>
                            <div class="col-12">
                                <input type="text" name="phone" class="form-control" placeholder="Phone" aria-label="Phone">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

</body>

</html>