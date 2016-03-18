<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>5 days alert</fullName>
        <ccEmails>Shunalism@gmail.com</ccEmails>
        <protected>false</protected>
        <recipients>
            <recipient>shunalism@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <template>unfiled$public/SalesNewCustomerEmail</template>
    </alerts>
    <alerts>
        <fullName>Shunsddf</fullName>
        <ccEmails>Shunalism@gmail.com</ccEmails>
        <protected>false</protected>
        <recipients>
            <recipient>shunalism@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <template>unfiled$public/SupportEscalatedCaseNotification</template>
    </alerts>
    <fieldUpdates>
        <fullName>shubfdg</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Closed date updated</fullName>
        <actions>
            <name>shubfdg</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>to set the Project status as Closed if the End Date is today</description>
        <formula>End_Date__c==TODAY()</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Reminder</fullName>
        <actions>
            <name>5 days alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>to send an email notification to remind the Project Manager about the end date of the project 5 days prior to the same</description>
        <formula>(TODAY() - End_Date__c)&lt;=5</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send a notification email to project manager</fullName>
        <actions>
            <name>ssm1</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Project_Detail__c.Status__c</field>
            <operation>equals</operation>
            <value>Open</value>
        </criteriaItems>
        <description>to create a Calendar task for the Project and assign it to the Project Manager whenever a new project is created. Send a notification email as well</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>SSm</fullName>
        <assignedTo>shunalism@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Project_Detail__c.End_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>In Progress</status>
    </tasks>
    <tasks>
        <fullName>ssm1</fullName>
        <assignedTo>shunalism@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Project_Detail__c.End_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>true</protected>
        <status>In Progress</status>
    </tasks>
</Workflow>
