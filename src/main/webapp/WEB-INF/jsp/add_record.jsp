<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chao
  Date: 2018/5/23
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>中华人民共和国传染病报告卡</title>
</head>
<body>
<form action="/record/save" method="post">
<table border="1">
    <tr>
        <td colspan="2">中华人民共和国传染病报告卡</td>
    </tr>
    <tr>
        <td>卡片编号： <input name="card_id" type="text" value=""/></td>
        <td>
            报告卡类别：
            <input name="card_category" type="radio" value="1"/> 1. 初次报告
            <input name="card_category" type="radio" value="2"/> 2. 订正报告
        </td>
    </tr>
    <tr>
        <td>患者姓名： <input name="patient_name" type="text" value=""/></td>
        <td><!--（患儿家长姓名： <input name="child_parent_name" type="text" value=""/>）--></td>
    </tr>
    <tr>
        <td>身份证号：<input name="citizen_id" type="text" value=""/></td>
        <td>
            性别：
            <input name="gender" type="radio" value="male"/> 1. 男
            <input name="gender" type="radio" value="female"/> 2. 女
        </td>
    </tr>

    <tr>
        <td colspan="2">出生日期：<input name="birthday" type="text" value=""/></td>
    </tr>

    <tr>
        <td>工作单位： <input name="workplace" type="text" value=""/></td>
        <td>联系电话： <input name="tel" type="text" value=""/></td>
    </tr>

    <tr>
        <td colspan="2">
            病人属于：
            <c:forEach items="${patientBelongList}" var="patientBelong">
                <input name="patient_belong" type="radio" value="${patientBelong.id}"/> ${patientBelong.name}
            </c:forEach>
        </td>
    </tr>

    <tr>
        <td colspan="2"> 现住址（详填）：<input name="present_address" type="text" value=""/></td>
    </tr>

    <tr>
        <td colspan="2">
            患者职业：
            <c:forEach items="${patientCareerList}" var="patientCareer">
                <input name="patient_career" type="radio" value="${patientCareer.id}"/> ${patientCareer.name}
            </c:forEach>
        </td>
    </tr>
    <tr>
        <td> 病例分类：</td>
        <td>
            (1) <c:forEach items="${caseClassificationList}" var="caseClassification">
            <input name="case_classification_a" type="radio"
                   value="${caseClassification.id}"/> ${caseClassification.name}
        </c:forEach> <br/>
            (2) <input name="case_classification_b" type="radio" value="1"/> 急性
            <input name="case_classification_b" type="radio" value="2"/> 慢性
        </td>
    </tr>

    <tr>
        <td colspan="2"> 发病日期：<input name="onset_date" type="text" value=""/></td>
    </tr>

    <tr>
        <td colspan="2"> 诊断日期：<input name="diagnosis_date" type="text" value=""/></td>
    </tr>

    <tr>
        <td colspan="2"> 死亡日期：<input name="death_date" type="text" value=""/></td>
    </tr>

    <tr>
        <td colspan="2">
            甲类传染病：<br>
            <c:forEach items="${infectiousDiseaseList}" var="infectiousDisease">
                <c:if test="${infectiousDisease.infectiousDiseaseClassification.id == 1}">
                    <input name="infectious_disease" type="radio"
                           value="${infectiousDisease.id}"/> ${infectiousDisease.name}
                </c:if>
            </c:forEach> <br/>
        </td>
    </tr>

    <tr>
        <td colspan="2">
            乙类传染病：<br>
            <c:forEach items="${infectiousDiseaseList}" var="infectiousDisease">
                <c:if test="${infectiousDisease.infectiousDiseaseClassification.id == 2}">
                    <input name="infectious_disease" type="radio"
                           value="${infectiousDisease.id}"/> ${infectiousDisease.name}
                </c:if>
            </c:forEach> <br/>
        </td>
    </tr>

    <tr>
        <td colspan="2">
            丙类传染病：<br>
            <c:forEach items="${infectiousDiseaseList}" var="infectiousDisease">
                <c:if test="${infectiousDisease.infectiousDiseaseClassification.id == 3}">
                    <input name="infectious_disease" type="radio"
                           value="${infectiousDisease.id}"/> ${infectiousDisease.name}
                </c:if>
            </c:forEach> <br/>
        </td>
    </tr>

    <tr>
        <td>
            订正病名：<input name="revised_disease_name" type="text" value=""/>
        </td>
        <td>
            退卡原因：<input name="refused_reason" type="text" value=""/>
        </td>
    </tr>

    <tr>
        <td>
            报告单位：<input name="report_unit" type="text" value=""/>
        </td>
        <td>
            联系电话：<input name="unit_tel" type="text" value=""/>
        </td>
    </tr>

    <tr>
        <td>
            报告医生：<input name="report_doctor" type="text" value=""/>
        </td>
        <td>
            填卡日期：<input name="report_date" type="text" value=""/>
        </td>
    </tr>

    <tr>
        <td colspan="2">
            备注：<input name="remark" type="text" value=""/>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit" value="提交"/>
        </td>
    </tr>
</table>
</form>

</body>
</html>
