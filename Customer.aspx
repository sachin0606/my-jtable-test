<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="JTableAspNetWebFormsDemos.Customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Master/Child Tables With jTable and ASP.NET Web Forms</title>
    <link href="/Content/Site.css" rel="stylesheet" type="text/css" />
    <link href="/Content/themes/metroblue/jquery-ui.css" rel="stylesheet"
        type="text/css" />
    <!-- jTable style file -->
    <link href="/Scripts/jtable/themes/metro/blue/jtable.css" rel="stylesheet"
        type="text/css" />
    <script src="/Scripts/modernizr-2.6.2.js" type="text/javascript"></script>
    <script src="/Scripts/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery-ui-1.9.2.min.js" type="text/javascript"></script>

    <script src="/Scripts/jtablesite.js" type="text/javascript"></script>
    <!-- A helper library for JSON serialization -->
    <script type="text/javascript" src="/Scripts/jtable/external/json2.js"></script>
    <!-- Core jTable script file -->
    <script type="text/javascript" src="/Scripts/jtable/jquery.jtable.js"></script>
    <!-- ASP.NET Web Forms extension for jTable -->
    <script type="text/javascript" src="/Scripts/jtable/extensions/jquery.jtable.aspnetpagemethods.js"></script>

    <style>
        .child-opener-image
        {
            cursor: pointer;
        }
        .child-opener-image-column
        {
            text-align: center;
        }
        .jtable-dialog-form
        {
            min-width: 220px;
        }
        .jtable-dialog-form input[type="text"]
        {
            min-width: 200px;
        }
    </style>

    <script type="text/javascript">

        $(document).ready(function () {
            $('#MarksTable').jtable({
                title: 'Table of people',
                paging: true,
                pageSize: 10,
                sorting: true,
                defaultSorting: 'First_Name ASC',
                actions: {
                    listAction: '/Customer.aspx/CustomerList',
                    createAction: '/Customer.aspx/CreateNewCustomer',
                    updateAction: '/Customer.aspx/UpdateCustomer',
                    deleteAction: '/Customer.aspx/DeleteCustomer'
                },
                fields: {
                    id: {
                        key: true,
                        create: false,
                        edit: false,
                        list: false
                    },
                    cust_id: {
                        title: 'Root ID',
                        width: '10%'
                    },
                    First_Name: {
                        title: 'First Name',
                        width: '10%'
                    },
                    MiddleName: {
                        title: 'Middle Name',
                        width: '10%'
                    },
                    LastName: {
                        title: 'Last Name',
                        width: '10%'
                    },
                    Address: {
                        title: 'Address',
                        type: 'textarea',
                        width: '15%'
                    },
                    BalanceAmt: {
                        title: 'Balance Amount',
                        width: '10%'
                    },
                    stbno: {
                        title: 'Setbox Number',
                        width: '10%'
                    },
                    vcno: {
                        title: 'VC NO',
                        width: '10%'
                    },
                    MobileNo: {
                        title: 'Mobile No.',
                        width: '10%'
                    },
                    Area_id: {
                        title: 'Area',
                        width: '12%',
                        options: '/Customer.aspx/GetArea_list'
                        
                    },
                    isactive: {
                        title: 'Status',
                        width: '10%',
                        options: { '1': 'Active','0': 'Inactive' }
                        
                    },
                    connectionDate: {
                        title: 'date',
                        width: '10%',
                        type: 'date',
                        displayFormat: 'yy-mm-dd'

                    }
                }
            });

            $('#MarksTable').jtable('load');
        });




    </script>

</head>
<body>
   
    <div>
    

        <div id="MarksTable"></div>
        <div>
            <br />
            <br />
        </div>

        <div id="AreaTable"></div> 

        </div>

        

        <script type="text/javascript">
            $(document).ready(function () {
                $('#AreaTable').jtable({
                    title: 'Area Detail',
                    paging: true,
                    pageSize: 10,
                    sorting: true,
                    defaultSorting: 'AreaName ASC',
                    actions: {
                        listAction: '/Customer.aspx/AreaList',
                        createAction: '/Customer.aspx/CreateNewArea',
                        updateAction: '/Customer.aspx/UpdateArea',
                        deleteAction: '/Customer.aspx/DeleteArea'
                    },
                    fields: {
                        Area_id: {
                            key: true,
                            list: false
                        },
                        AreaName: {
                            title: 'Area Name',
                            width: '15%'
                        },
                        Description: {
                            title: 'Description',
                            width: '45%'
                        }


                    }
                });
                
                $('#AreaTable').jtable('load');
            });

        </script>
    
   
</body>
</html>
